package t3h.edu.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import t3h.edu.dao.ProductDao;
import t3h.edu.model.Product;
import t3h.edu.util.SaveFile;

//@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_DELETE_OR_EDIT = "/WEB-INF/templates/ajax/ajax_exec.jsp";

	private static String rootPath = "";
	ProductDao dao;
	SaveFile saveFile;
	int MAX_MEMORY_SIZE = 1024 * 1024 * 60; // 60MB

	public ProductController() {
		super();
		dao = new ProductDao();
		saveFile = new SaveFile();
	}

	// obj.product_name=$("#product_name").val().trim();
	// obj.old_price=$("#old_price").val().trim();
	// obj.new_price=$("#new_price").val().trim();
	// obj.product_id=$("#product_id").val().trim();
	// obj.product_summary=$("#product_summary").val().trim();
	// obj.product_link=$("#product_link").val().trim();
	// //obj.seo_title=$("#seo_title").val().trim();
	// //obj.seo_keyword=$("#seo_keyword").val().trim();
	// //obj.seo_description=$("#seo_description").val().trim();
	// //obj.do_mem=$("#do_mem").val().trim();
	// //obj.do_ben_mau=$("#do_ben_mau").val().trim();
	// //obj.mat_do_soi=$("#mat_do_soi").val().trim();
	// //obj.ma_hang=$("#ma_hang").val().trim();
	// //obj.brand=$("#brand").val().trim();
	// //obj.seo_url=$("#seo_url").val().trim();
	// obj.content= $( 'div.editor' ).val();
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		rootPath = getServletContext().getRealPath("/") + "Upload/images/";

		String result = "";
		RequestDispatcher view;
		Product product = new Product();

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		HashMap<String, String> mParams = new HashMap<String, String>();
		if (isMultipart) {
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(MAX_MEMORY_SIZE);
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			try {
				// Parse the request
				FileItemIterator iter = upload.getItemIterator(request);
				while (iter.hasNext()) {
					FileItemStream item = iter.next();
					String keyName = item.getFieldName();
					InputStream stream = item.openStream();
					if (item.isFormField()) {
						if (!mParams.containsKey(keyName)) {
							mParams.put(keyName, Streams.asString(stream));

						}
					} else {
						product.setProductName(mParams.get("product_name"));
						product.setOldPrice(mParams.get("old_price"));
						product.setNewPrice(mParams.get("new_price"));
						product.setProductMahang(mParams.get("product_ma"));
						product.setProductSummary(mParams.get("product_summary"));
						product.setProductLink(mParams.get("product_link"));
						product.setProductContent(mParams.get("content"));
						product.setProductAvatar(rootPath + item.getName());

						String action = mParams.get("action");
						if (action == null || action.isEmpty() || action.equals("")) {
							// save image avatar product
							saveFile.prepare(item, stream, rootPath);
							result = dao.addProduct(product);
						} else if (action.equals("edit")) {
							// result = dao.updateUser(product);
						} else if (action.equals("delete")) {
							result = dao.deleteProduct(product.getProductName());
						}
						view = request.getRequestDispatcher(INSERT_DELETE_OR_EDIT);
						request.setAttribute("ajax_exec", result);
						view.forward(request, response);
					}
				}
			} catch (Exception e) {

			}
		}
		// product.setProductName(request.getParameter("product_name"));
		// product.setOldPrice(request.getParameter("old_price"));
		// product.setNewPrice(request.getParameter("new_price"));
		// product.setProductMahang(request.getParameter("product_ma"));
		// product.setProductSummary(request.getParameter("product_summary"));
		// product.setProductLink(request.getParameter("product_link"));
		// product.setProductContent(request.getParameter("content"));
		//
		// String action = request.getParameter("action");
		// if (action == null || action.isEmpty() || action.equals("")) {
		// //save image avatar product
		// saveFile.prepare(request, rootPath);
		// result = dao.addProduct(product);
		// } else if (action.equals("edit")) {
		// //result = dao.updateUser(product);
		// } else if (action.equals("delete")) {
		// result = dao.deleteProduct(product.getProductName());
		// }
		// view = request.getRequestDispatcher(INSERT_DELETE_OR_EDIT);
		// request.setAttribute("ajax_exec", result);
		// view.forward(request, response);
	}

}
