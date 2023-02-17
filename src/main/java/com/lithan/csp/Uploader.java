package com.lithan.csp;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.web.multipart.MultipartFile;

public class Uploader {
private MultipartFile file;
    
    public Uploader() {}
    public Uploader(String fileName, MultipartFile file, String _dir) throws IOException {
        this.file = file;
        
        Path dir = Paths.get(_dir);
        if(!Files.exists(dir)) {
            Files.createDirectories(dir);
        }
        
        try {
            InputStream inputStream = file.getInputStream();
            Path filePath = dir.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException ix) {
            System.out.println("Image err " + ix);
        }
    }
}
