/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.implement;

import DAO.IProductDBContext;
import DAO.implement.BaseDAO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Manufacturer;
import model.ManufacturerGroup;
import model.Product;
import model.Shop;

/**
 *
 * @author CuongTV
 */
public class ProductDBContext extends BaseDAO implements IProductDBContext {

    public ArrayList<Product> searchProducts(String keyword) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created from Product p\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (keyword != null) {
                sql += "where p.Name like '%'+ ? + '%'";
                stm = connection.prepareStatement(sql);
                stm.setString(1, keyword);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getBoolean("Status"));
                p.setCreated(rs.getDate("Created"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getProductsByCategory(int cid) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, c.ID as CategoryID, c.Name as CategoryName, c.Description as CategoryDescription \n"
                    + "from Product p inner join Category c\n"
                    + "on p.CategoryId = c.ID\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (cid != -1) {
                sql += "where c.ID = ?";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, cid);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("CategoryDescription"));
                p.setC(c);
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getBoolean("Status"));
                p.setCreated(rs.getDate("Created"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    // Get product information by product's id
    public Product getProduct(int id) {
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, c.ID as CategoryID, c.Name as CategoryName, c.Description as CategoryDescription \n"
                    + "from Product p inner join Category c\n"
                    + "on p.CategoryId = c.ID\n"
                    + "where p.ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("CategoryDescription"));
                p.setC(c);
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getBoolean("Status"));
                p.setCreated(rs.getDate("Created"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProducts(int pageindex, int pagesize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, p.CategoryID, p.CategoryName , p.CategoryDescription\n"
                    + "from (SELECT ROW_NUMBER() OVER (ORDER BY p.id asc) as rownum, p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, c.ID as CategoryID, c.Name as CategoryName, c.Description as CategoryDescription \n"
                    + "from Product p inner join Category c \n"
                    + "on p.CategoryId = c.ID) p \n"
                    + "Where rownum >= (? - 1)*? + 1 AND rownum <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("CategoryDescription"));
                p.setC(c);
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getBoolean("Status"));
                p.setCreated(rs.getDate("Created"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getRowCount() {
        try {
            String sql = "select COUNT(*) as Total from Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    @Override
    public ArrayList<Product> listProduct() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, c.ID as CategoryID, c.Name as CategoryName , c.Description as CategoryDescription\n"
                    + "from Product p inner join Category c \n"
                    + "on p.CategoryId = c.ID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("CategoryDescription"));
                p.setC(c);
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setDescription(rs.getString("Description"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getBoolean("Status"));
                p.setCreated(rs.getDate("Created"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    @Override
    public void insertProduct(Product p) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([CategoryId]\n"
                    + "           ,[Name]\n"
                    + "           ,[Image]\n"
                    + "           ,[Description]\n"
                    + "           ,[Discount]\n"
                    + "           ,[Created]\n"
                    + "           ,[Price])\n"
                    + "     VALUES\n"
                    + "           ?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?";
            PreparedStatement stm = connection.prepareStatement(sql);

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void updateProduct(Product p) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [CategoryId] = ?\n"
                    + "      ,[Name] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[Discount] = ?\n"
                    + "      ,[Created] = ?\n"
                    + "      ,[Price] = ?\n"
                    + " WHERE ID = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, p.getC().getId());
            stm.setString(2, p.getName());
            stm.setString(3, p.getDescription());
            stm.setFloat(4, p.getDiscount());
            stm.setDate(5, (Date) p.getCreated());
            stm.setString(6, p.getPrice());
            stm.setInt(7, p.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "WHERE ID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //categoryId = -1, manufacturerId = -1
    public ArrayList<Product> advanceSearch(int categoryId, int manufacturerId, int priceToSearch) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, \n"
                    + "p.Vote, p.Price, p.Discount, p.Status, \n"
                    + "p.Created, c.ID as CategoryID, c.Name as CategoryName , \n"
                    + "c.Description as CategoryDescription, m.ID as ManufacturerId, \n"
                    + "m.Name as ManufacturerName\n"
                    + "from Product p inner join Category c \n"
                    + "on p.CategoryId = c.ID\n"
                    + "left join ManufacturerGroup mg\n"
                    + "on mg.pId = p.ID\n"
                    + "left join Manufacturer m\n"
                    + "on m.ID = mg.mId\n"
                    + "where \n"
                    + "(1=1) ";

            int paramIndex = 0;
            HashMap<Integer, Object[]> params = new HashMap<>();

            if (categoryId != -1) {
                sql += "AND c.ID = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getName();
                param[1] = categoryId;
                params.put(paramIndex, param);
            }
            if (manufacturerId != -1) {
                sql += "AND m.ID = ? ";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getName();
                param[1] = manufacturerId;
                params.put(paramIndex, param);
            }

            if (priceToSearch != -1) {
                switch (priceToSearch) {
                    case 1:
                        sql += "AND p.Price between 0 and 2000000 ";
                        break;
                    case 2:
                        sql += "AND p.Price between 2000001 and 4000000 ";
                        break;
                    case 3:
                        sql += "AND p.Price between 4000001 and 7000000 ";
                        break;
                    case 4:
                        sql += "AND p.Price between 7000001 and 13000000 ";
                        break;
                    case 5:
                        sql += "AND p.Price > 13000000 ";
                        break;
                    default:
                        break;
                }
            }
//            if (sort != null) {
//                sql += "order by p.Price ?";
//                paramIndex++;
//                Object[] param = new Object[2];
//                param[0] = String.class.getName();
//                param[1] = sort;
//                params.put(paramIndex, param);
//            }

            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    stm.setInt(index, (Integer) value[1]);
                } else if (type.equals(String.class.getName())) {
                    stm.setString(index, value[1].toString());
                }
            }

//            if (priceToSearch != -1) {
//                switch (priceToSearch) {
//                    case 1:
//                        sql += "AND p.Price between 0 and 2000000";
//                        break;
//                    case 2:
//                        sql += "AND p.Price between 2000001 and 4000000";
//                        break;
//                    case 3:
//                        sql += "AND p.Price between 4000001 and 7000000";
//                        break;
//                    case 4:
//                        sql += "AND p.Price between 7000001 and 13000000";
//                        break;
//                    case 5:
//                        sql += "AND p.Price > 13000000";
//                        break;
//                    default:
//                        break;
//                }
//            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("ID"));
                product.setName(rs.getString("Name"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                product.setVote(rs.getInt("Vote"));
                product.setPrice(rs.getString("Price"));
                product.setDiscount(rs.getFloat("Discount"));
                product.setStatus(rs.getBoolean("Status"));
                product.setCreated(rs.getDate("Created"));
                Category category = new Category();
                category.setId(rs.getInt("CategoryId"));
                category.setName(rs.getString("CategoryName"));
                category.setDescription(rs.getString("CategoryDescription"));
                product.setC(category);
//                Manufacturer manufacturer = new Manufacturer();
//                manufacturer.setId(rs.getInt("ManufacturerId"));
//                manufacturer.setName(rs.getString("ManufacturerName"));
//                ManufacturerGroup mg = new ManufacturerGroup();
//                mg.setP(product);
//                mg.setM(manufacturer);
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}
