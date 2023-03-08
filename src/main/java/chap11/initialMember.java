package chap11;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener; // 원래는 web.xml에 등록을 해주어야 함

@WebListener
public class initialMember implements ServletContextListener {


    public void contextInitialized(ServletContextEvent sce)  { 	// 어플리케이션이 시작 될 때 자동으로 시행되는 메서드 WAS가 특정 이벤트가 발생했을 때 실행함
        ServletContext context = sce.getServletContext();	// ArrayList<Member>을 어플리케이션 저장소에 저장 (공유 데이터가 된다)
        ArrayList<Member> members = new ArrayList<Member>();	//
        
        for(int i =0; i<8; i++) {
        	members.add(new Member("박찬호"+ i, "park" + i + "@daum.net"));
        }
        
    	members.add(new Member("김연아", null));
    	members.add(new Member("김연경", null));
    	
    	context.setAttribute("members", members);
    	context.setAttribute("member", new Member());
    	
    	System.out.println("InitialMimber Strat!");	// 콘솔창에 출력됨
   }
	
    public void contextDestroyed(ServletContextEvent sce)  { 	// 어플리케이션이 종료 될 때 자동으로 시행되는 메서드
    	System.out.println("InitialMimber Destroy!");
   }
    
	
}
