const String bearerToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI0MTMiLCJDdXJyZW50Q29tSWQiOiIxIiwibmJmIjoxNjk0ODQ0MTg2LCJleHAiOjE2OTU0NDg5ODYsImlhdCI6MTY5NDg0NDE4Nn0.VKZ3-Nj1xKqvFSVaLPKCxbplFxW374hTwdKtd6aah_o";
const String categoryUri = "https://www.pqstec.com/InvoiceApps/Values/GetCategoryList";

String getProductByCategoryUri(String query){
  return "https://www.pqstec.com/InvoiceApps/Values/GetProductList?searchquery=$query";
}