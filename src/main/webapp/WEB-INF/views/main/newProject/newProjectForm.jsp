<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

  <!-- BEGIN: Vendor CSS-->
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/extensions/rowReorder.dataTables.min.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/extensions/responsive.dataTables.min.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/icheck.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/custom.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/toggle/switchery.min.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/datetime/bootstrap-datetimepicker.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/pickadate/pickadate.css">
  <!-- END: Vendor CSS-->

  <!-- BEGIN: Theme CSS-->
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap-extended.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/colors.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/components.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/pickers/daterange/daterange.css">
  <!-- END: Theme CSS-->

  <!-- BEGIN: Page CSS-->
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-contacts.css">
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/pickers/daterange/daterange.css">
  <!-- END: Page CSS-->

  <!-- BEGIN: Custom CSS-->
  <link rel="stylesheet" type="text/css"
        href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
  <!-- END: Custom CSS-->

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->
<body>

<!-- BEGIN: Content-->
<div class="app-content container center-layout mt-2">
  <div class="content-overlay"></div>
  <div class="content-wrapper">
    <div class="content-header row"></div>
    <div class="content-detached content-right">
      <div class="content-body">
        <div class="content-overlay"></div>
        <section class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <div class="col-12 col-sm-6">
                  <div class="form-group validate">
                    <div class="controls">
                      <label><h5>
                        <b>프로젝트 명</b>
                      </h5></label> <input type="text" class="form-control"
                                           style="width: 500px;" aria-invalid="false" required>
                      <div class="help-block"></div>
                    </div>
                  </div>
                  <div class="form-group validate">
                    <div class="controls">
                      <label><h5>
                        <b>프로젝트 기한</b>
                      </h5></label> <input type="text" class="form-control daterange"
                                           style="width: 500px;" required>
                      <div class="input-group-append">
													<span class="input-group-text"> <span
                                                            class="fa fa-calendar"></span>
													</span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group validate">
                    <div class="controls">
                      <label><h5>
                        <b>프로젝트 소개</b>
                      </h5></label>
                      <textarea rows="5" cols="5" class="form-control"
                                placeholder="프로젝트 소개 글을 작성해주세요." style="width: 500px;"
                                aria-invalid="false" required></textarea>
                      <div class="help-block"></div>
                    </div>
                  </div>
                  <div class="form-group pb-1">
                    <div>
                      <label for="switchery0" class="font-medium-2 text-bold-600">프로젝트
                        공개 여부</label> <input type="checkbox" name="switchery"
                                             id="switchery0" class="switchery" checked=""
                                             data-switchery="true" style="display: none;">
                    </div>
                  </div>
                  <button type="submit"
                          class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">수정</button>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
    <div class="sidebar-detached sidebar-left">
      <div class="sidebar">
        <div class="bug-list-sidebar-content">
          <!-- Predefined Views -->
          <div class="card">
            <div class="card-head" style="align: center;">
              <div style="text-align: center;">
                <br>
                <h4>
                  <strong>프로젝트 설정</strong>
                </h4>
              </div>
              <div class="media p-1">
                <div class="media-left pr-1">
                  <a
                          href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/3.jpg"
                          itemprop="contentUrl" data-size="455x335"> <img
                          class="gallery-thumbnail card-img-top"
                          src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/3.jpg"
                          itemprop="thumbnail" alt="Image description">
                  </a>
                </div>

              </div>
            </div>

            <!-- contacts view -->
            <div class="card-body" style="height: 244px;">
              <div class="list-group">
                <button type="button"
                        class="btn btn-success round btn-min-width mr-1 mb-1">
                  대표 이미지 변경 <i class="icon-settings"></i>
                </button>
                <button type="button"
                        class="btn btn-danger round btn-min-width mr-1 mb-1">
                  프로젝트 중도 해산 <i class="icon-close"></i>
                </button>
              </div>
            </div>

          </div>
          <!--/ Predefined Views -->

        </div>
      </div>
    </div>
  </div>
</div>
<!-- END: Content-->

<!-- BEGIN: Vendor JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/jquery.dataTables.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/jquery.raty.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.rowReorder.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/toggle/bootstrap-checkbox.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/toggle/switchery.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/dateTime/moment-with-locales.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/dateTime/bootstrap-datetimepicker.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/legacy.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/daterange/daterangepicker.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-contacts.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/forms/switch.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pickers/dateTime/bootstrap-datetime.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pickers/dateTime/pick-a-datetime.js"></script>

<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>