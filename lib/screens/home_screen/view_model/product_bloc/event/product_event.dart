class ProductEvent {
  
}

class ProductListOnTapEvent extends ProductEvent {
  
}

class ProductListOnQueryEvent extends ProductEvent {
    final String queryTxt;
    ProductListOnQueryEvent({required this.queryTxt});
}