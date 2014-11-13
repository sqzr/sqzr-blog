package handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by weiyang on 2014/11/13.
 */
public class BooleanTypeHandler implements TypeHandler<Boolean> {

    private static final byte YES = 1;
    private static final byte NO = 0;
    private static final byte NULL  = -1;

    public Boolean getResult(CallableStatement cs, int columnIndex) throws SQLException {
        byte value = cs.getByte(columnIndex);
        if (YES == value) {
            return Boolean.TRUE;
        } else if (NO == value) {
            return Boolean.FALSE;
        }
        return Boolean.FALSE;
    }

    public Boolean getResult(ResultSet rs, int columnIndex) throws SQLException {
        byte value = rs.getByte(columnIndex);
        if (YES == value) {
            return Boolean.TRUE;
        } else if (NO == value) {
            return Boolean.FALSE;
        }
        return Boolean.FALSE;
    }


    @Override
    public void setParameter(PreparedStatement ps, int i, Boolean parameter, JdbcType jdbcType) throws SQLException {
        byte value = NULL;
        if (null != parameter) {
            if (((Boolean) parameter).booleanValue()) {
                value = YES;
            } else {
                value = NO;
            }
        }
        ps.setByte(i, value);
    }

    public Boolean getResult(ResultSet rs, String columnName) throws SQLException {
        byte value = rs.getByte(columnName);
        if (YES == value) {
            return Boolean.TRUE;
        } else if (NO == value) {
            return Boolean.FALSE;
        }
        return Boolean.FALSE;
    }


    public Boolean valueOf(String value) {
        if (null != value) {
            if (Boolean.valueOf(value).booleanValue()) {
                return Boolean.TRUE;
            } else {
                return Boolean.FALSE;
            }
        }
        return Boolean.FALSE;
    }
}
