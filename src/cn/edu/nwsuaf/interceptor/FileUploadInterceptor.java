package cn.edu.nwsuaf.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * @author 刘志伟
 *
 * 2017-6-29
 * 
 * 文件大小拦截
 */

public class FileUploadInterceptor extends HandlerInterceptorAdapter {
    private long maxSize;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断是否文件上传
        if(request!=null && ServletFileUpload.isMultipartContent(request)) {
            ServletRequestContext ctx = new ServletRequestContext(request);
            //获取上传文件尺寸大小
            long requestSize = ctx.contentLength();
            if (requestSize > maxSize) {
                //当上传文件大小超过指定大小限制后，模拟抛出MaxUploadSizeExceededException异常
                request.setAttribute("errorMsg", "上传的文件大小超出限定值");
                System.out.println("上传的文件大小超出限定值");
                request.getRequestDispatcher("errorMsg.jsp").forward(request, response);
                throw new MaxUploadSizeExceededException(maxSize);
            }
        }
        return true;
    }
    public void setMaxSize(long maxSize) {
        this.maxSize = maxSize;
    }
}