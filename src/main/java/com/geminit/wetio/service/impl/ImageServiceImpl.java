package com.geminit.wetio.service.impl;

import com.geminit.wetio.entity.Image;
import com.geminit.wetio.repository.ImageRepository;
import com.geminit.wetio.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    ImageRepository imageRepository;

    public List<Image> findAll(){
        return imageRepository.findAll();
    }
}
