package com.marcin.facades;

import com.marcin.dto.ProductDTO;

import java.io.IOException;
import java.util.List;

public interface ProductFacade {

    void registerNewProduct(ProductDTO productDTO);

    List<ProductDTO> getAll() throws IOException;

}
