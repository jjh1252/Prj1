package notice.controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeController");
		
		//DB에 저장
		NoticeDao dao = new NoticeDao();
		List<Notice> list = dao.getNotices();
	
		//request에 n을 저장 즉 jsp단에서 n을 이용해서 vo패키지에있는
		//getTitle 를 호출해서 $(n.title)이렇게 사용할 수 있다.
		request.setAttribute("list", list);
		//jsp로 forward
		request.getRequestDispatcher("notice.jsp").forward(request, response);

		
		
	}

}
