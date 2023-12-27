/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.NewsDAO;
import entity.News;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Hieu
 */
@WebServlet(name="NewsServelet", urlPatterns={"/news"})
public class NewsServelet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewsServelet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewsServelet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        NewsDAO pdb=new NewsDAO();
        List<News>list1= pdb.getAllNews();
        int page,numberpage=3;
        int size=list1.size();
        int num=(size%numberpage==0?(size/numberpage):((size/numberpage)+1));
        String xpage=request.getParameter("page");
        if(xpage==null){
            page=1;
        }
        else{
            page=Integer.parseInt(xpage);
        }
        int start,end;
        start=(page-1)*numberpage;
        end=Math.min(page*numberpage,size);
        List<News>list= pdb.getListByPage(list1, start, end);
        
        request.setAttribute("data", list);
        request.setAttribute("page", page);
        
        request.setAttribute("num", num);
        request.getRequestDispatcher("news.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");


        String date = request.getParameter("date").trim();
        String title = request.getParameter("title").trim();
        String desc = request.getParameter("desc").trim();
        String link = request.getParameter("link").trim();
        String image = request.getParameter("image").trim();

        News news = new News(0, date, image, title, link, desc);
        NewsDAO newDAO = new NewsDAO();
        newDAO.addNews(news);
        response.sendRedirect("./news");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
