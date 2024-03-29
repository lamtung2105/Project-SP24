/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.OrderDetails;
import entity.Product;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author Acer
 */
public class OrderDetailsDAO extends GenericDAO<OrderDetails> {

    @Override
    public List<OrderDetails> findAll() {
        return queryGenericDAO(OrderDetails.class);
    }

    @Override
    public int insert(OrderDetails t) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([quantity]\n"
                + "           ,[productId]\n"
                + "           ,[orderId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", t.getQuantity());
        parameterMap.put("2", t.getProductId());
        parameterMap.put("3", t.getOrderId());
        return insertGenericDAO(sql, parameterMap);
    }

    public List<OrderDetails> findByOrderId(int id) {
        String sql = "SELECT * FROM [dbo].[OrderDetails] WHERE [orderId] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("orderId", id);
        return queryGenericDAO(OrderDetails.class, sql, parameterMap);
    }

}
