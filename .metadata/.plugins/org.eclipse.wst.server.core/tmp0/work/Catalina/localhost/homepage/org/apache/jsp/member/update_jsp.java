/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.55
 * Generated at: 2014-09-16 04:58:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import memberModel.*;
import java.util.*;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");

	String id = (String) session.getAttribute("id");
	
	MemberDto dto = MemberDao.getInstance().update(id);
	

      out.write('\n');
      memberModel.MemberDto member = null;
      member = (memberModel.MemberDto) _jspx_page_context.getAttribute("member", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (member == null){
        member = new memberModel.MemberDto();
        _jspx_page_context.setAttribute("member", member, javax.servlet.jsp.PageContext.PAGE_SCOPE);
        out.write("\n");
        out.write("   ");
        org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("member"), request);
        out.write('\n');
      }
      out.write('\n');



      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  \t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "index.jsp", out, false);
      out.write("\n");
      out.write("      <div align=\"center\">\n");
      out.write("         <div>회원수정</div>\n");
      out.write("         <form class=border_doc name=\"memberForm\" action=\"updateOk.jsp\" method=\"post\" onsubmit=\"return registerForm(this)\">\n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>아이디</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span>*<input type=\"text\" name=\"id\"  size=\"30\" value = \"");
      out.print(dto.getId());
      out.write("\" readonly/></span>\n");
      out.write("               </div>\n");
      out.write("            </div>   \n");
      out.write("            \n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>비밀번호</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span>*<input type=\"password\" name=\"password\" value = \"");
      out.print(dto.getPassword() );
      out.write("\" size=\"30\"/></span>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>비밀번호확인</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span>*<input type=\"password\" name=\"passwordCheck\" value = \"");
      out.print(dto.getPassword() );
      out.write("\" size=\"30\"/></span>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>   \n");
      out.write("               <div class=border_box_left>이름</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span>*<input type=\"text\" name=\"name\" value = \"");
      out.print(dto.getName() );
      out.write("\" size=\"30\" readonly/></span>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>주민번호</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span>*<input type=\"text\" name=\"jumin1\"value = \"");
      out.print(dto.getJumin1() );
      out.write("\"  size=\"20\" readonly/></span>\n");
      out.write("                  <span>-<input type=\"text\" name=\"jumin2\"value = \"");
      out.print(dto.getJumin2() );
      out.write("\"  size=\"20\" readonly/></span>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>이메일</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span><input type=\"text\" name=\"email\" value = \"");
      out.print(dto.getEmail() );
      out.write("\" size=\"30\"/></span>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>우편번호</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span><input type=\"text\" name=\"zipcode\" value = \"");
      out.print(dto.getZipcode());
      out.write("\" size=\"30\"/></span>\n");
      out.write("                  <span><input type=\"button\" value=\"우편번호검색\" onclick = \"zipcodeRead()\"></span>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>주소</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span><input type=\"text\" name=\"address\" value = \"");
      out.print(dto.getAddress());
      out.write("\" size=\"50\"/></span>\n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>   \n");
      out.write("               <div class=border_box_left>직업</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span>\n");
      out.write("                     <select name=\"job\" style=\"width:60;\">\n");
      out.write("                        <option value=\"sp\">전문직</option>\n");
      out.write("                        <option value=\"engineer\">엔지니어</option>\n");
      out.write("                        <option value=\"constructor\">건설업</option>\n");
      out.write("                        <option value=\"student\">학생</option>\n");
      out.write("                     </select>\n");
      out.write("                  </span>\n");
      out.write("                  <script type=\"text/javascript\">\n");
      out.write("                  \tmemberForm.job.value\n");
      out.write("                  </script>\n");
      out.write("                  <span>&nbsp;&nbsp;&nbsp;");
      out.print(dto.getJob());
      out.write("</span>\n");
      out.write("               </div>               \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=border_div>\n");
      out.write("               <div class=border_box_left>메일수신</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span><input type=\"radio\" name=\"mailing\" value=\"yes\"/>yes</span>\n");
      out.write("                  <span><input type=\"radio\" name=\"mailing\"  value=\"no\"/>no</span>\n");
      out.write("                  <span>&nbsp;&nbsp;&nbsp;");
      out.print(dto.getMailing() );
      out.write("</span>\n");
      out.write("                  <script type=\"text/javascript\">\n");
      out.write("                  \tfor(var i =0; i<memberForm.mailing.length; i++){\n");
      out.write("                  \t\tif(memberForm.mailing[i].value==\"");
      out.print(member.getMailing());
      out.write("\"){\n");
      out.write("                  \t\t\tmemberForm.mailing[i].checked=true;\n");
      out.write("                  \t\t}\n");
      out.write("                  \t}\n");
      out.write("                  </script>\n");
      out.write("               </div>\n");
      out.write("               \n");
      out.write("               <div class=border_box_left>관심분야</div>\n");
      out.write("               <div class=border_box_right>\n");
      out.write("                  <span><input type=\"checkbox\" name=\"interestValue\" value=\"경제\"/>경제</span>\n");
      out.write("                  <span><input type=\"checkbox\" name=\"interestValue\" value=\"IT\"/>IT</span>\n");
      out.write("                  <span><input type=\"checkbox\" name=\"interestValue\" value=\"음악\"/>음악</span>\n");
      out.write("                  <span><input type=\"checkbox\" name=\"interestValue\" value=\"미술\"/>미술</span>\n");
      out.write("                  <span>&nbsp;&nbsp;&nbsp;");
      out.print(dto.getInterest() );
      out.write("</span>\n");
      out.write("                  <span><input type=\"hidden\" name=\"interest\"/></span>\n");
      out.write("                  ");

                  	StringTokenizer str = new StringTokenizer(dto.getInterest(), ",");
                  	while(str.hasMoreTokens()){
                  		String strinterest=str.nextToken();
                  	
                  
      out.write("\n");
      out.write("                  <script type=\"text/javascript\">\n");
      out.write("\t                  \tfor(var i=0; i<memberForm.interestValue.length;i++){\n");
      out.write("\t                  \t\tif(memberForm.interestValue[i].value==\"");
      out.print(strinterest);
      out.write("\"){\n");
      out.write("\t                  \t\t\tmemberForm.interestValue[i].checked=true\n");
      out.write("\t                  \t\t}\n");
      out.write("\t                  \t}\n");
      out.write("                  </script>\n");
      out.write("                  ");
}
      out.write("\n");
      out.write("                  \n");
      out.write("               </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"border_div\">\n");
      out.write("               <span><input type=\"submit\" value=\"가입\"></span>\n");
      out.write("               <span><input type=\"reset\" value=\"취소\"></span>      \n");
      out.write("            </div>                        \n");
      out.write("         </form>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("</body>\n");
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
