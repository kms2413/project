/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.55
 * Generated at: 2014-09-15 05:23:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import memberModel.*;
import java.util.ArrayList;

public final class zipcode_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");

   request.setCharacterEncoding("euc-kr");
   String checkDong=request.getParameter("dong");
   //out.print("checkDong:" + checkDong);
   
   ArrayList<ZipcodeDto> zipcodeList=null;
   if (checkDong != null) {
      zipcodeList = MemberDao.getInstance().zipcodeReader(checkDong);
      //out.print(zipcodeList.size());
   }   
   

      out.write("\n");
      out.write("<html>\n");
      out.write("   <head>\n");
      out.write("      <meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-KR\">\n");
      out.write("      <title>우편번호</title>\n");
      out.write("      <script type=\"text/javascript\" src=\"script.js\"></script>\n");
      out.write("      <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"/>\n");
      out.write("   </head>\n");
      out.write("   <body>\n");
      out.write("      <form action=\"zipcode.jsp\" method=\"post\">\n");
      out.write("         <table align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("               <td>\n");
      out.write("                  <input type=\"text\" name=\"dong\"/>\n");
      out.write("                  <input type=\"submit\" value=\"검색\"/>\n");
      out.write("            </tr>\n");
      out.write("         </table>\n");
      out.write("      </form>\n");
      out.write("      \n");
      out.write("      ");
if(zipcodeList == null){ 
      out.write("\n");
      out.write("         <table align=\"center\">\n");
      out.write("            <tr><td>검색된 결과가 없습니다.</td></tr>\n");
      out.write("         </table>\n");
      out.write("      ");
}else {
      out.write("\n");
      out.write("         <table align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("               <td>아래 우편번호를 클릭하세요.</td>\n");
      out.write("            </tr>\n");
      out.write("            ");
for(int i=0;i<zipcodeList.size();i++){
               ZipcodeDto address = zipcodeList.get(i);
               String zipcode = address.getZipcode();
               String sido = address.getSido();
               String gugun = address.getGugun();
               String dong = address.getDong();
               String ri = "";
               if(address.getRi() != null) ri=address.getRi();
               String bunji = "";
               if(address.getBunji() != null) bunji=address.getBunji();
            
            
      out.write("\n");
      out.write("               <tr>\n");
      out.write("                  <td>\n");
      out.write("                     <a href=\"javascript:sendAddress('");
      out.print(zipcode);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(sido );
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(gugun );
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(dong );
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(ri );
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(bunji );
      out.write("')\">\n");
      out.write("                          ");
      out.print(zipcode);
      out.print(sido );
      out.print(gugun );
      out.print(dong );
      out.print(ri );
      out.print(bunji );
      out.write("\n");
      out.write("                       </a>\n");
      out.write("                   </td>\n");
      out.write("               </tr>                  \n");
      out.write("            ");
} 
      out.write("\n");
      out.write("         </table>\n");
      out.write("      ");
} 
      out.write("\n");
      out.write("   </body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
