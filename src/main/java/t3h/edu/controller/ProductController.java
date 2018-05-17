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

	private static String INSERT_OR_EDIT = "/product.jsp";
	private static String LIST_PRODUCT = "/WEB-INF/templates/product/ajaxProduct.jsp";
	private static String COUNT_PRODUCT = "/WEB-INF/templates/product/ajax_count.jsp";

	private static String rootPath = "";
	ProductDao dao;
	SaveFile saveFile;
	int MAX_MEMORY_SIZE = 1024 * 1024 * 60; // 60MB

	public ProductController() {
		super();
		dao = new ProductDao();
		saveFile = new SaveFile();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");
		String page = request.getParameter("page_index");
		String record_per_page = request.getParameter("record_per_page");

		String product_id = request.getParameter("product_id");
		String product_name = request.getParameter("product_name");
		String product_mahang = request.getParameter("product_mahang");

		if (action.equalsIgnoreCase("listProduct") && !page.equals("-1")) {
			forward = LIST_PRODUCT;
			request.setAttribute("users",
					dao.getAllProducts(product_id, product_name, product_mahang, record_per_page, page));
		} else if (action.equalsIgnoreCase("listProduct") && page.equals("-1")) {
			forward = COUNT_PRODUCT;
			// request.setAttribute("countUser",
			// dao.countAllUsers(record_per_page));
			request.setAttribute("countProduct",
					dao.getAllProducts(product_id, product_name, product_mahang, record_per_page, page));
		} else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		rootPath = "Upload/images/";
		String filePath = getServletContext().getRealPath("/") + "Upload/images/";

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
						String product_name = new String(mParams.get("product_name").getBytes("iso-8859-1"),
								"UTF-8");
						product.setProductName(product_name);
						product.setOldPrice(mParams.get("old_price"));
						product.setNewPrice(mParams.get("new_price"));
						product.setProductMahang(mParams.get("product_ma"));
						String product_summary = new String(mParams.get("product_summary").getBytes("iso-8859-1"),
								"UTF-8");
						product.setProductSumary(product_summary);
						product.setProductLink(mParams.get("product_link"));
						String content = new String(mParams.get("content").getBytes("iso-8859-1"), "UTF-8");
						product.setProductDescription(content);
						product.setProductAvatar(rootPath + item.getName());

						String action = mParams.get("action");
						if (action == null || action.isEmpty() || action.equals("")) {
							// save image avatar product
							saveFile.prepare(item, stream, filePath);
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
	}

}
