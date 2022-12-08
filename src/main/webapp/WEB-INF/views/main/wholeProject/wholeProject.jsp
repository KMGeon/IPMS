<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="app-content container center-layout mt-2"  style="overflow: auto">
  <div class="content-overlay"></div>
  <div class="content-wrapper">
    <div class="content-body"><!-- Search form-->
      <section id="search-images" class="card overflow-hidden">
        <div class="card-header">
          <h4 class="card-title"style="font-size: xx-large"><strong>전체 프로젝트</strong></h4>
          <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
          <div class="heading-elements">
            <ul class="list-inline mb-0">
              <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
              <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
              <li><a data-action="expand"><i class="feather icon-maximize"></i></a></li>
              <li><a data-action="close"><i class="feather icon-x"></i></a></li>
            </ul>
          </div>
        </div>
        <div class="card-content collapse show">
          <div class="card-body pb-0">
            <fieldset class="form-group position-relative mb-0">
              <div class="col-sm-12 col-md-6" style="float: right">
                <div id="app-invoice-table_filter" class="dataTables_filter"><label style="float: right">Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="app-invoice-table"></label></div>
              </div>
            </fieldset>
          </div>
          <!--Search Navbar-->
          <div id="search-nav" class="card-body">

            <ul class="nav nav-inline" style="float:right;">
              <li class="nav-item">
                <i class="fonticon-classname"></i> 정렬</a>
              </li>
              <li class="dropdown nav-item float-right">
                <a href="#" class="btn dropdown-toggle" data-toggle="dropdown">
                  <i class="pe-li-settings"></i> <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="dropdown-item"><a href="#" class="dropdown-link">조회순</a></li>
                  <li class="dropdown-item"><a href="#" class="dropdown-link">최신순</a></li>
                  <li class="dropdown-item"><a href="#" class="dropdown-link">인기순</a></li>
                </ul>
              </li>
            </ul>
          </div>
          <!--/ Search Navbar-->
          <!--Search Result-->
          <div id="search-results" class="card-body">
            <div class="my-gallery" itemscope="" itemtype="http://schema.org/ImageGallery" data-pswp-uid="1">
              <div class="card-deck-wrapper">
                <div class="card-deck">
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/main/projlistdetail" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/1.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Maecenas</span> sollicitudin <span class="font-small-2 text-muted float-right">720 x 600</span></p>
                      <p class="card-text">Nulla ac vulputate mauris. Nam tincidunt odio purus.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/2.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/2.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Aliquam </span> vel nib <span class="font-small-2 text-muted float-right">480 x 360</span></p>
                      <p class="card-text">Phasellus vitae aliquam felis, et bibendum orci.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/3.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/3.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Molestie </span> accumsan <span class="font-small-2 text-muted float-right">480 x 360</span></p>
                      <p class="card-text">Maecenas commodo odio sed nibh viverra vestibulum.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/4.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/4.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Nam eu </span> efficitur <span class="font-small-2 text-muted float-right">500 x 360</span></p>
                      <p class="card-text">Donec porttitor massa vitae leo rutrum viverra.</p>
                    </div>
                  </figure>
                </div>
              </div>
              <div class="card-deck-wrapper">
                <div class="card-deck mt-1">
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/5.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/5.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Porttitor </span> donec <span class="font-small-2 text-muted float-right">560 x 360</span></p>
                      <p class="card-text">Sed suscipit velit vitae justo pharetra.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/6.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/6.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Velit et </span> interdum <span class="font-small-2 text-muted float-right">500 x 360</span></p>
                      <p class="card-text"> Duis auctor velit et interdum maximus.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/7.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/7.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Natoque </span> efficitur <span class="font-small-2 text-muted float-right">800 x 600</span></p>
                      <p class="card-text">Cum sociis natoque penatibus et magnis dis.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/8.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/8.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Pharetra </span> enim id <span class="font-small-2 text-muted float-right">500 x 360</span></p>
                      <p class="card-text">Mauris imperdiet enim id urna pharetra.</p>
                    </div>
                  </figure>
                </div>
              </div>
              <div class="card-deck-wrapper">
                <div class="card-deck mt-1">
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/9.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/9.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Integer </span> fermentum <span class="font-small-2 text-muted float-right">380 x 360</span></p>
                      <p class="card-text">Vel lacinia cursus, est dui tincidunt sem.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/10.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/10.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Donec congue </span> nec <span class="font-small-2 text-muted float-right">500 x 360</span></p>
                      <p class="card-text">Morbi laoreet ultrices mi ut imperdiet.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/11.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/11.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Vivamus  </span> eget<span class="font-small-2 text-muted float-right">500 x 360</span></p>
                      <p class="card-text">Lorem ipsum dolor sit amet.</p>
                    </div>
                  </figure>
                  <figure class="card card-img-top border-grey border-lighten-2" itemprop="associatedMedia" itemscope="" itemtype="http://schema.org/ImageObject">
                    <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/12.jpg" itemprop="contentUrl" data-size="480x360">
                      <img class="gallery-thumbnail card-img-top" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/12.jpg" itemprop="thumbnail" alt="Image description">
                    </a>
                    <div class="card-body px-0">
                      <p><span class="text-bold-600">Aenean </span> pharetra <span class="font-small-2 text-muted float-right">500 x 360</span></p>
                      <p class="card-text">Ligula ornare velit porttitor viverra et a felis.</p>
                    </div>
                  </figure>
                </div>
              </div>
              <div class="text-center">
                <nav aria-label="Page navigation">
                  <ul class="pagination pagination-separate pagination-round pagination-flat" style="text-align: center;margin-left: 500px">
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">« Prev</span>
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item active"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">Next »</span>
                        <span class="sr-only">Next</span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
            <!-- Root element of PhotoSwipe. Must have class pswp. -->
            <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
              <!-- Background of PhotoSwipe.
             It's a separate element as animating opacity is faster than rgba(). -->
              <div class="pswp__bg"></div>
              <!-- Slides wrapper with overflow:hidden. -->
              <div class="pswp__scroll-wrap">
                <!-- Container that holds slides.
              PhotoSwipe keeps only 3 of them in the DOM to save memory.
              Don't modify these 3 pswp__item elements, data is added later on. -->
                <div class="pswp__container">
                  <div class="pswp__item"></div>
                  <div class="pswp__item"></div>
                  <div class="pswp__item"></div>
                </div>
                <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->

                </div>
              </div>
            </div>
            <!--/ PhotoSwipe -->
          </div>
        </div>
        <!--/ Search Result-->
      </section>
      <!--/ Search form-->
