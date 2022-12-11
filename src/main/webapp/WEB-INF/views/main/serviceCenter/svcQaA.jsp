<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="content-wrapper" style="margin-top: 50px" ;>
    <div class="content-header row" style="margin-left: 46%;">
        <div class="content-header-left col-md-6 col-12 mb-2">
            <h3 class="content-header-title mb-2" style="">고객센터</h3>
        </div>
    </div>
    <div class="row breadcrumbs-top" style="margin-left: 720px;font-weight: bold; ">
        <div class="breadcrumb-wrapper col-12">
            <ol class="breadcrumb" style="position: relative;margin-right: 15px">
                <li class="breadcrumb-item bold "><a href="/main/svcNotice">공지사항</a>
                </li>
                <li class="breadcrumb-item"><a href="/main/svcFaq">자주묻는질문</a>
                </li>
                <li class="breadcrumb-item active"><a href="/main/svcQaA">Q&A</a>
                </li>
            </ol>
        </div>
    </div>
    <div class="card" style="width: 70%;margin-left: 300px;">
        <div class="card-body">
            <!-- datatable started -->
            <div id="app-invoice-wrapper" class="">
                <div id="app-invoice-table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="dataTables_length" id="app-invoice-table_length"><label>Show <select
                                    name="app-invoice-table_length" aria-controls="app-invoice-table"
                                    class="custom-select custom-select-sm form-control form-control-sm">
                                <option value="12">12</option>
                                <option value="20">20</option>
                                <option value="30">30</option>
                                <option value="40">40</option>
                            </select> entries</label></div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div id="app-invoice-table_filter" class="dataTables_filter"><label style="float: right">Search:<input
                                    type="search" class="form-control form-control-sm" placeholder=""
                                    aria-controls="app-invoice-table"></label></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="app-invoice-table" class="table dataTable no-footer dtr-column"
                                   style="width: 100%;" role="grid" aria-describedby="app-invoice-table_info">
                                <thead class="border-bottom border-dark">
                                <tr role="row">
                                    <th class="control sorting_disabled" rowspan="1" colspan="1"
                                        style="width: 13.776px; display: none;" aria-label=""></th>
                                    <th class="dt-checkboxes-cell dt-checkboxes-select-all sorting_asc" rowspan="1"
                                        colspan="1" style="width: 13.776px;" data-col="1" aria-label=""><input
                                            type="checkbox"></th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1" style="width: 95.7161px;" aria-label="
              Invoice#
            : activate to sort column ascending">
                                        <span class="align-middle">번호</span>
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1"
                                        style="width: 91.9922px;"
                                        aria-label="Amount: activate to sort column ascending">제목
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1" style="width: 70.5469px;"
                                        aria-label="Date: activate to sort column ascending">내용
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1" style="width: 181.966px;"
                                        aria-label="Customer: activate to sort column ascending">작성자
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1" style="width: 119.753px;"
                                        aria-label="Tags: activate to sort column ascending">날짜
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="/main/svcQaADetail">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td class="dt-checkboxes-cell sorting_1"><input type="checkbox"
                                                                                    class="dt-checkboxes"></td>
                                    <td>
                                        <a href="invoice-view.html">INV-00956</a>
                                    </td>
                                    <td><span class="invoice-amount">$459.30</span></td>
                                    <td><span class="invoice-date">12-08-19</span></td>
                                    <td><span class="invoice-customer">Pixinvent PVT. LTD</span></td>
                                    <td>
                                        <span class="bullet bullet-success bullet-sm"></span>
                                        Technology
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-5">
                            <div class="dataTables_info" id="app-invoice-table_info" role="status" aria-live="polite">
                                Showing 1 to 12 of 49 entries
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="app-invoice-table_paginate">
                                <ul class="pagination">
                                    <li class="paginate_button page-item previous disabled"
                                        id="app-invoice-table_previous"><a href="#" aria-controls="app-invoice-table"
                                                                           data-dt-idx="0" tabindex="0"
                                                                           class="page-link">Previous</a></li>
                                    <li class="paginate_button page-item active"><a href="#"
                                                                                    aria-controls="app-invoice-table"
                                                                                    data-dt-idx="1" tabindex="0"
                                                                                    class="page-link">1</a></li>
                                    <li class="paginate_button page-item "><a href="#" aria-controls="app-invoice-table"
                                                                              data-dt-idx="2" tabindex="0"
                                                                              class="page-link">2</a></li>
                                    <li class="paginate_button page-item "><a href="#" aria-controls="app-invoice-table"
                                                                              data-dt-idx="3" tabindex="0"
                                                                              class="page-link">3</a></li>
                                    <li class="paginate_button page-item "><a href="#" aria-controls="app-invoice-table"
                                                                              data-dt-idx="4" tabindex="0"
                                                                              class="page-link">4</a></li>
                                    <li class="paginate_button page-item "><a href="#" aria-controls="app-invoice-table"
                                                                              data-dt-idx="5" tabindex="0"
                                                                              class="page-link">5</a></li>
                                    <li class="paginate_button page-item next" id="app-invoice-table_next"><a href="#"
                                                                                                              aria-controls="app-invoice-table"
                                                                                                              data-dt-idx="6"
                                                                                                              tabindex="0"
                                                                                                              class="page-link">Next</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>