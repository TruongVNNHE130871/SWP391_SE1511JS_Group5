/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.implement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Manufacturer;

/**
 *
 * @author CuongTV
 */
public class ManufacturerDBContext extends BaseDAO {

    public ArrayList<Manufacturer> getManufacturers() {
        ArrayList<Manufacturer> manufacturers = new ArrayList<>();
        try {
            String sql = "select * from Manufacturer";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Manufacturer manufacturer = new Manufacturer();
                manufacturer.setId(rs.getInt("ID"));
                manufacturer.setName(rs.getString("Name"));
                manufacturers.add(manufacturer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManufacturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return manufacturers;
    }
}
