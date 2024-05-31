package util;

import java.io.IOException;
import java.util.Map;



import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class uploadCloud {
	public static String upload(String fileName)
	{
//		Part filePart = request.getPart("file");
//		String fileName = filePart.getSubmittedFileName();
		
        String duondan = "D:\\anh thuyet trinh\\";

        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dzmtmpayb",
                "api_key", "121958147899567",
                "api_secret", "lb8EfjswYlyTT2wc0n4NZzO2eAA"
        ));

        
        Map<String, Object> params = ObjectUtils.asMap(
            "use_filename", true,
            "unique_filename", false,
            "overwrite", true
        );

        try {
            // Upload file lên Cloudinary
            Map uploadResult = cloudinary.uploader().upload(duondan+fileName, params);

            // In thông tin kết quả
            System.out.println("Upload thành công:");
            String imageUrl = (String) uploadResult.get("url");
            return imageUrl;
        } catch (IOException e) {
            // Xử lý lỗi nếu có
            e.printStackTrace();
            return null;
        }
    }
	
}

