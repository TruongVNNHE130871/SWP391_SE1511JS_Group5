/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO;

import java.util.List;
import model.News;

/**
 *
 * @author VinhNT
 */
public interface INewsDBContext {

    void insert(News news);

    void edit(News news);

    void delete(int id);

    News get(int id);

    List<News> getAll();
}
