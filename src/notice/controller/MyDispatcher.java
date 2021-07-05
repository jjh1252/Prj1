package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.customer.NoticeController;
import notice.controller.customer.NoticeDelProcController;
import notice.controller.customer.NoticeDetailController;
import notice.controller.customer.NoticeEditController;
import notice.controller.customer.NoticeEditProcController;
import notice.controller.customer.NoticeRegController;
import notice.controller.customer.NoticeRegProcController;

//서블릿형식으로 doget / gopost를 받기위해
public class MyDispatcher extends HttpServlet{
	
	
	
/*	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service신호");
	}
*/
	//순서2 여기서 받은다음 아래 실행 즉 일처리를 여기 한군대에서 진행한다.
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet : doPost 모두 받기");
		String uri = request.getRequestURI();//신호들어온 URI주소값 받아오기
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println("URI : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);
		
		/*NoticeDetailController controller1 = new NoticeDetailController();
		NoticeEditController controller2 = new NoticeEditController();*/
		Controller controller = null;
		
		try {//com신호가 같다면 신호를 가지고
			//NoticeDetailController에 execute메소드로 
			//request, response 신호를 보내준다.
			if(com.equals("/customer/noticeDetail.do")) {
				controller = new NoticeDetailController();
			}else if(com.equals("/customer/noticeEdit.do")) {
				controller = new NoticeEditController();
			}else if(com.equals("/customer/noticeEditProc.do")) {
				controller = new NoticeEditProcController();
			}else if(com.equals("/customer/noticeReg.do")) {
				controller = new NoticeRegController();
			}else if(com.equals("/customer/noticeRegProc.do")) {
				controller = new NoticeRegProcController();
			}else if(com.equals("/customer/noticeDelProc.do")) {
				controller = new NoticeDelProcController();
			}else if(com.equals("/customer/notice.do")) {
				controller = new NoticeController();
			}
			controller.execute(request, response);
		}catch(Exception e) {
			
		}
		
	}
	
	@Override //순서1 신호를 여기서 먼저 받아드리고 doService로 보내줌
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}
	
	@Override //순서1 신호를 여기서 먼저 받아드림 doService로 보내줌
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}
	
}
