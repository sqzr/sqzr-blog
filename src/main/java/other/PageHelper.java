package other;

/**
 * Created by weiyang on 2014/10/14.
 */
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.*;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Properties;

/**
 * Mybatis - 通用分页拦截器
 *
 * @author liuzh/abel533/isea533
 * @version 3.3.0
 *          项目地址 : http://git.oschina.net/free/Mybatis_PageHelper
 */
@Intercepts(@Signature(type = Executor.class, method = "query", args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}))
public class PageHelper implements Interceptor {
    private static final ThreadLocal<Page> LOCAL_PAGE = new ThreadLocal<Page>();
    //sql工具类
    private static SqlUtil SQLUTIL;
    //RowBounds参数offset作为PageNum使用 - 默认不使用
    private static boolean offsetAsPageNum = false;
    //RowBounds是否进行count查询 - 默认不查询
    private static boolean rowBoundsWithCount = false;
    //当设置为true的时候，如果pagesize设置为0（或RowBounds的limit=0），就不执行分页
    private static boolean pageSizeZero = false;
    //分页合理化，true开启，如果分页参数不合理会自动修正。默认false不启用
    private static boolean reasonable = false;

    /**
     * 设置数据库方言
     *
     * @param dialect
     */
    public static void setDialect(String dialect) {
        SQLUTIL = new SqlUtil(dialect);
    }

    /**
     * 设置RowBounds参数offset作为PageNum使用 - 默认不使用
     *
     * @param offsetAsPageNum
     */
    public static void setOffsetAsPageNum(String offsetAsPageNum) {
        PageHelper.offsetAsPageNum = Boolean.parseBoolean(offsetAsPageNum);
    }

    /**
     * 设置RowBounds是否进行count查询 - 默认不查询
     *
     * @param rowBoundsWithCount
     */
    public static void setRowBoundsWithCount(String rowBoundsWithCount) {
        PageHelper.rowBoundsWithCount = Boolean.parseBoolean(rowBoundsWithCount);
    }

    /**
     * 设置为true的时候，如果pagesize值为0（或RowBounds的limit=0），就不执行分页
     *
     * @param pageSizeZero
     */
    public static void setPageSizeZero(String pageSizeZero) {
        PageHelper.pageSizeZero = Boolean.parseBoolean(pageSizeZero);
    }

    /**
     * 分页合理化
     *
     * @return
     */
    public static boolean isReasonable() {
        return reasonable;
    }

    /**
     * 设置分页合理化，true开启，如果分页参数不合理会自动修正。默认false不启用
     *
     * @param reasonable
     */
    public static void setReasonable(String reasonable) {
        PageHelper.reasonable = Boolean.parseBoolean(reasonable);
    }

    /**
     * 开始分页
     *
     * @param pageNum  页码
     * @param pageSize 每页显示数量
     */
    public static void startPage(int pageNum, int pageSize) {
        startPage(pageNum, pageSize, true);
    }

    /**
     * 开始分页
     *
     * @param pageNum  页码
     * @param pageSize 每页显示数量
     * @param count    是否进行count查询
     */
    public static void startPage(int pageNum, int pageSize, boolean count) {
        LOCAL_PAGE.set(new Page(pageNum, pageSize, count));
    }

    /**
     * 获取分页参数
     *
     * @param rowBounds RowBounds参数
     * @return 返回Page对象
     */
    private Page getPage(RowBounds rowBounds) {
        Page page = LOCAL_PAGE.get();
        //移除本地变量
        LOCAL_PAGE.remove();

        if (page == null) {
            if (offsetAsPageNum) {
                page = new Page(rowBounds.getOffset(), rowBounds.getLimit(), rowBoundsWithCount);
            } else {
                page = new Page(rowBounds, rowBoundsWithCount);
            }
        }
        return page;
    }

    /**
     * Mybatis拦截器方法
     *
     * @param invocation 拦截器入参
     * @return 返回执行结果
     * @throws Throwable 抛出异常
     */
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        final Object[] args = invocation.getArgs();
        RowBounds rowBounds = (RowBounds) args[2];
        if (LOCAL_PAGE.get() == null && rowBounds == RowBounds.DEFAULT) {
            return invocation.proceed();
        } else {
            //忽略RowBounds-否则会进行Mybatis自带的内存分页
            args[2] = RowBounds.DEFAULT;
            MappedStatement ms = (MappedStatement) args[0];
            Object parameterObject = args[1];
            //分页信息
            Page page = getPage(rowBounds);
            //pageSizeZero的判断
            if (pageSizeZero && page.getPageSize() == 0) {
                //执行正常（不分页）查询
                Object result = invocation.proceed();
                //得到处理结果
                page.addAll((List) result);
                //相当于查询第一页
                page.setPageNum(1);
                //这种情况相当于pageSize=total
                page.setPageSize(page.size());
                //仍然要设置total
                page.setTotal(page.size());
                //返回结果仍然为Page类型 - 便于后面对接收类型的统一处理
                return page;
            }
            //简单的通过total的值来判断是否进行count查询
            if (page.isCount()) {
                BoundSql boundSql = ms.getBoundSql(parameterObject);
                //将参数中的MappedStatement替换为新的qs
                args[0] = SQLUTIL.getCountMappedStatement(ms, boundSql);
                //查询总数
                Object result = invocation.proceed();
                //设置总数
                page.setTotal((Integer) ((List) result).get(0));
                if (page.getTotal() == 0) {
                    return page;
                }
            }
            //pageSize>0的时候执行分页查询，pageSize<=0的时候不执行相当于可能只返回了一个count
            if (page.getPageSize() > 0 &&
                    ((rowBounds == RowBounds.DEFAULT && page.getPageNum() > 0)
                            || rowBounds != RowBounds.DEFAULT)) {
                BoundSql boundSql = ms.getBoundSql(parameterObject);
                //将参数中的MappedStatement替换为新的qs
                args[0] = SQLUTIL.getPageMappedStatement(ms, boundSql);
                //判断parameterObject，然后赋值
                args[1] = SQLUTIL.setPageParameter(parameterObject, boundSql, page);
                //执行分页查询
                Object result = invocation.proceed();
                //得到处理结果
                page.addAll((List) result);
            }
            //返回结果
            return page;
        }
    }

    /**
     * 只拦截Executor
     *
     * @param target
     * @return
     */
    @Override
    public Object plugin(Object target) {
        if (target instanceof Executor) {
            return Plugin.wrap(target, this);
        } else {
            return target;
        }
    }

    /**
     * 设置属性值
     *
     * @param p 属性值
     */
    public void setProperties(Properties p) {
        //数据库方言
        String dialect = p.getProperty("dialect");
        setDialect(dialect);
        //offset作为PageNum使用
        String offsetAsPageNum = p.getProperty("offsetAsPageNum");
        setOffsetAsPageNum(offsetAsPageNum);
        //RowBounds方式是否做count查询
        String rowBoundsWithCount = p.getProperty("rowBoundsWithCount");
        setRowBoundsWithCount(rowBoundsWithCount);
        //当设置为true的时候，如果pagesize设置为0（或RowBounds的limit=0），就不执行分页
        String pageSizeZero = p.getProperty("pageSizeZero");
        setPageSizeZero(pageSizeZero);
        //分页合理化，true开启，如果分页参数不合理会自动修正。默认false不启用
        String reasonable = p.getProperty("reasonable");
        setReasonable(reasonable);
    }
}