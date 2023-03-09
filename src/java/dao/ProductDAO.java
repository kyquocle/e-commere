/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBHelper;

/**
 *
 * @author DELL
 */
public class ProductDAO implements Serializable{
    
      private List<ProductDTO> itemsList;
      
       public List<ProductDTO> getItemsList() {
        return itemsList;
    }
       
       public void searchProduct(String searchValue)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            //1. Get connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create sql string
                String sql = "SELECT p.productID, p.proName, p.Description, p.yearPublish, c.catgoryName, p.price, i.filename, i.picdata, i.picID   \n"
                        + "FROM Product p full JOIN Category c ON p.CategoryID = c.CategoryID full JOIN Picture i ON p.picID = i.picID \n"
                        + "Where p.proName LIKE ? ";
//                String sql = "SELECT p.productID, p.proName, p.Description, p.yearPublish, c.catgoryName, p.price \n"
//                        + "FROM Product p full JOIN Category c ON p.CategoryID = c.CategoryID  \n"
//                        + "Where p.proName like ? ";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setNString(1, "%" + searchValue + "%");
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    //get field/column
                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    String description = rs.getString("description");
                    int yearPublish = rs.getInt("yearPublish");
                    float price = rs.getFloat("price");
                    String catgoryName = rs.getString("catgoryName");
                    String filename = rs.getString("filename");
                    byte[] picData = rs.getBytes("picdata");

                    //Create DTO instance
                    ProductDTO dto = new ProductDTO(productID, proName, description, yearPublish, price, catgoryName, picData);
                    //add to bookList
                    if (this.itemsList == null) {
                        this.itemsList = new ArrayList<>();
                    }//end bookList is not existed
                    this.itemsList.add(dto);
                }//end bookList is traversed



            }//end con is available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
       
       
       public void showProduct(String searchValue)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Get connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create sql string

                String sql = "SELECT p.productID, p.proName, p.Description, p.yearPublish, c.catgoryName, p.price \n"
                        + "FROM Product p full JOIN Category c ON p.CategoryID = c.CategoryID  \n"
                        + "Where p.productID = ? ";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    //get field/column
                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    String description = rs.getString("description");
                    int yearPublish = rs.getInt("yearPublish");
                    float price = rs.getFloat("price");
                    String catgoryName = rs.getString("catgoryName");

                    //Create DTO instance
                    ProductDTO dto = new ProductDTO(productID, proName, description, yearPublish, price, catgoryName);
                    //add to bookList
                    if (this.itemsList == null) {
                        this.itemsList = new ArrayList<>();
                    }//end bookList is not existed
                    this.itemsList.add(dto);
                }//end bookList is traversed
            }//end con is available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
       
       public void getProduct()
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Get connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create sql string

                String sql = "SELECT p.productID, p.proName, p.Description, p.yearPublish, c.catgoryName, p.price \n"
                        + "FROM Product p full JOIN Category c ON p.CategoryID = c.CategoryID  \n";
                       
                //3. Create statement
                stm = con.prepareStatement(sql);
             
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    //get field/column
                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    String description = rs.getString("description");
                    int yearPublish = rs.getInt("yearPublish");
                    String catgoryName = rs.getString("catgoryName");
                    float price = rs.getFloat("price");
                    

                    //Create DTO instance
                    ProductDTO dto = new ProductDTO(productID, proName, description, yearPublish, price, catgoryName);
                    //add to bookList
                    if (this.itemsList == null) {
                        this.itemsList = new ArrayList<>();
                    }//end bookList is not existed
                    this.itemsList.add(dto);
                }//end bookList is traversed
            }//end con is available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
       
       
       public void showIMG()
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Get connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create sql string

                String sql = "select p.productID , i.filename, i.picdata, i.picID \n"
                        + "FROM Product p inner JOIN  Picture i ON p.picID = i.picID  \n";
                //3. Create statement
                stm = con.prepareStatement(sql);
                
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    //get field/column
                    String productID = rs.getString("productID");
                    String filename = rs.getString("filename");
                    byte[] picData = rs.getBytes("picdata");
                    String picID = rs.getString("picID");

                    //Create DTO instance
                    ProductDTO dto = new ProductDTO(productID, picID, picData);
                    //add to bookList
                    if (this.itemsList == null) {
                        this.itemsList = new ArrayList<>();
                    }//end bookList is not existed
                    this.itemsList.add(dto);
                }//end bookList is traversed
            }//end con is available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
       
        public void importImg(String searchValue, String basePath)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
                String picName = "myImage";
        String imageFolderPath = "images";
        String filename = "poork10.jpg";
        try {
            //1. Get connection
            con = DBHelper.makeConnection();
            if (con != null) {
                
                
                                // Get the base path for the project
//                String basePath = request.getServletContext().getRealPath("/");

                // Combine the base path with the image folder path
                String imagePath = basePath + imageFolderPath;
                stmt = con.prepareCall("{ call dbo.usp_ExportImage(?, ?, ?) }");
                stmt.setNString(1, picName);
                stmt.setNString(2, imagePath );
                stmt.setNString(3, filename);
                stmt.execute();
            }//end con is available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
    }
        
        public boolean updateProduct(ProductDTO dto) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean checkUpdate = true;
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            //2. Create SQL String
//            if (con != null) {
            //3. Create statement
            if (con != null) {
                String sql = "Update Product "
                        + "SET proName = ?, description = ?,  yearPublish = ?, price = ?, catgoryName = ? \n"
                        + "Where productID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getProName());
                stm.setString(2, dto.getDescription());
                stm.setInt(3, dto.getYearPublish());
                stm.setFloat(4, dto.getPrice());
                stm.setString(5, dto.getCatgoryName());
                stm.setString(6, dto.getProductID());
                checkUpdate = stm.executeUpdate() > 0 ? true : false;
            }
            //4. Execute query
//                int effectedRows = stm.executeUpdate();
            //5. Process result
//                if (effectedRows > 0) {
//                    checkUpdate = true;
//                }
//            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkUpdate;
    }

        public boolean deleteProduct(String productID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();

            if (con != null) {
                //2.tạo SQL statement String
                String sql = "Delete From Product "
                        + "Where productID = ? ";
                //3.Tạo statement dể nạp SQL vào  
                stm = con.prepareStatement(sql);
                stm.setString(1, productID);
                //4. executeQuery
                int effectedRow = stm.executeUpdate();
                //5. process
                if (effectedRow > 0) {
                    result = true;
                }
            }// end if connection is exist
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
        
        public void showIMG_1()
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Get connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create sql string

                String sql = "select * \n"
                        + "FROM Product p inner JOIN  Picture i ON p.picID = i.picID  inner JOIN Category c ON p.CategoryID = c.CategoryID\n";
                //3. Create statement
                stm = con.prepareStatement(sql);
                
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    //get field/column
                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    String description = rs.getString("description");
                    int yearPublish = rs.getInt("yearPublish");
                    float price = rs.getFloat("price");
                    String catgoryName = rs.getString("catgoryName");
                    byte[] picData = rs.getBytes("picdata");
                    String picID = rs.getString("picID");

                    //Create DTO instance
                    ProductDTO dto = new ProductDTO(productID, proName, description, yearPublish, price, catgoryName, picID, picData);
                    //add to bookList
                    if (this.itemsList == null) {
                        this.itemsList = new ArrayList<>();
                    }//end bookList is not existed
                    this.itemsList.add(dto);
                }//end bookList is traversed
            }//end con is available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
        
 public ProductDTO getProductbyID(String productID) 
            throws SQLException, NamingException {
        
        ProductDTO result = null;
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sqlStr = "select * \n"
                        + "FROM Product p inner JOIN  Picture i ON p.picID = i.picID  inner JOIN Category c ON p.CategoryID = c.CategoryID\n"
                        + "WHERE productID = ?";
                stmt = con.prepareStatement(sqlStr);
                stmt.setString(1, productID);
                rs = stmt.executeQuery();
                
                while (rs.next()) {
                    //get field/column
//                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    String description = rs.getString("description");
                    int yearPublish = rs.getInt("yearPublish");
                    float price = rs.getFloat("price");
                    String catgoryName = rs.getString("catgoryName");
                    byte[] picData = rs.getBytes("picdata");
                    String picID = rs.getString("picID");

                    //Create DTO instance
                    result = new ProductDTO(productID, proName, description, yearPublish, price, catgoryName, picID, picData);
              return result;
                }
                
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }       
}
