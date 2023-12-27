
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import entity.News;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author admin
 */
public class NewsDAO extends DBContext{

    public List<News> getAllNews(){
        List<News> list = new ArrayList<>();
        String sql = "select * from News order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News c = new News(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                    );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean addNews(News news){
        int effectRow=0;
        try {
            String query = "insert into News values(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, news.getDate());
            ps.setString(2, news.getImage());
            ps.setString(3, news.getTitle());
            ps.setString(4, news.getLink());
            ps.setString(5, news.getDesc());
            effectRow = ps.executeUpdate();
        } catch (Exception e) {
        }
        return effectRow>0;
    }
    public boolean deleteNews(int id){
        int effectRow=0;
        try {
            String query = "DELETE FROM News WHERE id=?;";
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps = connection.prepareStatement(query);
            ps.setString(1, id+"");
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return effectRow>0;
    }
//    News page
    public List<News>getListByPage(List<News>list,int start,int end){
        ArrayList<News>arr =new ArrayList<>();
        for(int i=start;i<end;i++){
            arr.add(list.get(i));
        }
        return arr;
    }
}
