

if (.Platform$OS.type == "windows") {
  
  PATH = paste0(getwd(), path.expand("\\example_word_vecs.txt"))
  INVALID_PATH = paste0(getwd(), path.expand("\\INVALID\\example_word_vecs.txt"))
}

if (.Platform$OS.type == "unix") {
  
  PATH = paste0(getwd(), path.expand("/example_word_vecs.txt"))
  INVALID_PATH = paste0(getwd(), path.expand("/INVALID/example_word_vecs.txt"))
}



context('count-rows function')


# cnt_tsts = 1


while(T) {
  

  #============================
  # 'Count_Rows' error handling
  #============================
  
  
  testthat::test_that("in case that the path to a file is invalid, it returns an error", {
    
    #-------------------------------------------------------------------- debug tests
    cat("test-count_rows.R : test id", cnt_tsts, "\n")
    
    cnt_tsts <<- cnt_tsts + 1
    #-------------------------------------------------------------------- 
    
    testthat::expect_error( Count_Rows(INVALID_PATH, verbose = F) )
  })
  
  
  testthat::test_that("in case that the verbose parameter is not a boolean, it returns an error", {
    
    #-------------------------------------------------------------------- debug tests
    cat("test-count_rows.R : test id", cnt_tsts, "\n")
    
    cnt_tsts <<- cnt_tsts + 1
    #-------------------------------------------------------------------- 
    
    testthat::expect_error( Count_Rows(PATH, verbose = 'F') )
  })
  
  
  
  #=========================
  # 'Count_Rows' expect true
  #=========================
  
  
  testthat::test_that("the 'Count_Rows' function returns the correct output", {
    
    res = Count_Rows(PATH, verbose = F)
    
    #-------------------------------------------------------------------- debug tests
    cat("test-count_rows.R : test id", cnt_tsts, "\n")
    
    cnt_tsts <<- cnt_tsts + 1
    #-------------------------------------------------------------------- 
    
    testthat::expect_true( is.numeric(res) && res > 0 )
  })
  
  break    # exit loop for tests ( count iterations / tests for debugging )
}
