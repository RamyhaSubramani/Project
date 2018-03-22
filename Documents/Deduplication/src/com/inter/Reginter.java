package com.inter;





import com.bean.AccessBean1;
import com.bean.Filebean;
import com.bean.Regbean;
import com.bean.Request;
import com.servlet.Login;

public interface Reginter {
public int register(Regbean rb);

public boolean login(Regbean lb);
public int Fileinsert(Filebean fb);

public int getrequest(Request dd);

public int getaccess(AccessBean1 as);

public String getfilekey(String Filename);


}
