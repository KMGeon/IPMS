<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="app-content container center-layout mt-2" style="overflow: auto">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-body"><!-- Search form-->
            <section id="search-images" class="card overflow-hidden">
                <div class="card-header">
                    <h4 class="card-title" style="font-size: xx-large"><strong>전체 프로젝트</strong></h4>
                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pb-0">
                    </div>
                    <!--Search Navbar-->
                    <div class="todo-fixed-search d-flex justify-content-between align-items-center">
                        <div class="sidebar-toggle d-block d-lg-none">
                            <i class="feather icon-menu"></i>
                        </div>
                        <fieldset class="form-group position-relative has-icon-left m-0 flex-grow-1 pl-2">
                            <input type="text" class="form-control todo-search" id="todo-search"
                                   placeholder="Search Task">
                            <div class="form-control-position">
                                <i class="feather icon-search"></i>
                            </div>
                        </fieldset>
                        <div class="todo-sort dropdown mr-1">
                            <button class="btn dropdown-toggle sorting" type="button" id="sortDropdown"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="feather icon-filter"></i>
                                <span>Sort</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sortDropdown"
                                 x-placement="bottom-end"
                                 style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(111px, 37px, 0px);">
                                <a class="dropdown-item ascending" href="#">최신순</a>
                                <a class="dropdown-item descending" href="#">조회순</a>
                            </div>
                        </div>
                    </div>
                    <!--/ Search Navbar-->
                    <!--Search Result-->
                    <div id="search-results" class="card-body">
                        <div class="my-gallery" itemscope="" itemtype="http://schema.org/ImageGallery"
                             data-pswp-uid="1">
                            <div class="card-deck-wrapper">
                                <div class="card-deck">
                                    <figure class="card card-img-top border-grey border-lighten-2"
                                            itemprop="associatedMedia" itemscope=""
                                            itemtype="http://schema.org/ImageObject">
                                        <a href="/main/projlistdetail" itemprop="contentUrl" data-size="480x360">
                                            <img class="gallery-thumbnail card-img-top"
                                                 src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/1.jpg"
                                                 itemprop="thumbnail" alt="Image description">
                                        </a>
                                        <div class="card-body px-0">
                                            <p><span class="text-bold-600"></span> sollicitudin <span
                                                    class="font-small-2 text-muted float-right">720 x 600</span></p>
                                            <p class="card-text">Nulla ac vulputate mauris. Nam tincidunt odio
                                                purus.</p>
                                        </div>
                                    </figure>
                                    <figure class="card card-img-top border-grey border-lighten-2"
                                            itemprop="associatedMedia" itemscope=""
                                            itemtype="http://schema.org/ImageObject">
                                        <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/2.jpg"
                                           itemprop="contentUrl" data-size="480x360">
                                            <img class="gallery-thumbnail card-img-top"
                                                 src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/2.jpg"
                                                 itemprop="thumbnail" alt="Image description">
                                        </a>
                                        <div class="card-body px-0">
                                            <p><span class="text-bold-600">Aliquam </span> vel nib <span
                                                    class="font-small-2 text-muted float-right">480 x 360</span></p>
                                            <p class="card-text">Phasellus vitae aliquam felis, et bibendum orci.</p>
                                        </div>
                                    </figure>
                                    <figure class="card card-img-top border-grey border-lighten-2"
                                            itemprop="associatedMedia" itemscope=""
                                            itemtype="http://schema.org/ImageObject">
                                        <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/3.jpg"
                                           itemprop="contentUrl" data-size="480x360">
                                            <img class="gallery-thumbnail card-img-top"
                                                 src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/3.jpg"
                                                 itemprop="thumbnail" alt="Image description">
                                        </a>
                                        <div class="card-body px-0">
                                            <p><span class="text-bold-600">Molestie </span> accumsan <span
                                                    class="font-small-2 text-muted float-right">480 x 360</span></p>
                                            <p class="card-text">Maecenas commodo odio sed nibh viverra vestibulum.</p>
                                        </div>
                                    </figure>
                                    <figure class="card card-img-top border-grey border-lighten-2"
                                            itemprop="associatedMedia" itemscope=""
                                            itemtype="http://schema.org/ImageObject">
                                        <a href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/4.jpg"
                                           itemprop="contentUrl" data-size="480x360">
                                            <img class="gallery-thumbnail card-img-top"
                                                 src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/4.jpg"
                                                 itemprop="thumbnail" alt="Image description">
                                        </a>
                                        <div class="card-body px-0">
                                            <p><span class="text-bold-600">Nam eu </span> efficitur <span
                                                    class="font-small-2 text-muted float-right">500 x 360</span></p>
                                            <p class="card-text">Donec porttitor massa vitae leo rutrum viverra.</p>
                                        </div>
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination pagination-separate pagination-round pagination-flat"
                                style="text-align: center;margin-left: 500px">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">« Prev</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item "><a class="page-link" href="#">3</a></li>
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
