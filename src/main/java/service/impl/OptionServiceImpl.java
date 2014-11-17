package service.impl;

import dao.OptionDao;
import model.Option;
import service.OptionService;

import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/10/7.
 */
public class OptionServiceImpl implements OptionService {
    private OptionDao optionDao;

    @Override
    public Map<String, String> getAllOption() {
        return optionDao.getAllOption();
    }

    @Override
    public void update(List<Option> options) {
        for (Option option : options) {
                optionDao.update(option);
        }
    }

    public boolean update(Option option) {
        return (optionDao.update(option) == 1) ? true : false;
    }

    // ---


    public OptionDao getOptionDao() {
        return optionDao;
    }

    public void setOptionDao(OptionDao optionDao) {
        this.optionDao = optionDao;
    }
}
