/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO;

import model.Review;
import java.util.List;

/**
 *
 * @author VinhNT
 */
public interface IReviewDBContext {

    /**
     * Insert review into Database
     *
     * @param review
     */
    public void insert(Review review);

    /**
     * Get all list review form Database
     *
     *
     * @param id
     * @return
     */
    public List<Review> getReviewById(int id);

    void delete(int id);

    public List<Review> getAllReview();

}