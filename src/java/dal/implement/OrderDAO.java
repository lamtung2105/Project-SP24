/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Order;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author Acer
 */
public class OrderDAO extends GenericDAO<Order> {

    @Override
    public List<Order> findAll() {
        return queryGenericDAO(Order.class);
    }

    @Override
    public int insert(Order t) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([amount]\n"
                + "           ,[accountId]\n"
                + "           ,[createAt])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", t.getAmount());
        parameterMap.put("2", t.getAccountId());
        parameterMap.put("3", t.getCreateAt());
        return insertGenericDAO(sql, parameterMap);

    }

    public List<Order> findPaidOrdersByAccountId(int accountId) {
        String sql = "SELECT * FROM [dbo].[Order] WHERE [accountId] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("accountId", accountId);
        return queryGenericDAO(Order.class, sql, parameterMap);
    }

}
