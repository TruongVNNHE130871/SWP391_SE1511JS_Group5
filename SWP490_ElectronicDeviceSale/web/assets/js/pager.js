/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function generatePagger(div, pageindex, totalpage, gap) {
    var container = document.getElementById(div);
    if (pageindex - gap > 1) {
        container.innerHTML += '<a href="HomePageController?page=1#menu">First</a>';
    }

    for (var i = pageindex - gap; i < pageindex; i++) {
        if (i > 0) {
            container.innerHTML += '<a href="HomePageController?page=' + i + '#menu">' + i + '</a>';
        }
    }

    container.innerHTML += '<a href="#menu" class="target">' + pageindex + '</a>';

    for (var i = pageindex + 1; i < pageindex + gap; i++) {
        if (i <= totalpage) {
            container.innerHTML += '<a href="HomePageController?page=' + i + '#menu">' + i + '</a>';
        }
    }

    if (pageindex + gap < totalpage) {
        container.innerHTML += '<a href="HomePageController?page=' + totalpage + '#menu">Last</a>';
    }
}

//Generate Paging Page Search 
function generatePagerSearchController(div, pageindex, totalpage, gap, keyword, filterindex) {
    var container = document.getElementById(div);
    if (pageindex - gap > 1) {
        container.innerHTML += '<a href="SearchController?keyword=' + keyword + '&page=1&filterindex=' + filterindex + '#menu">First</a>';
    }

    for (var i = pageindex - gap; i < pageindex; i++) {
        if (i > 0) {
            container.innerHTML += '<a href="SearchController?keyword=' + keyword + '&page=' + i + '&filterindex=' + filterindex + '#menu">' + i + '</a>';
        }
    }

    container.innerHTML += '<a href="#menu" class="target">' + pageindex + '</a>';

    for (var i = pageindex + 1; i < pageindex + gap; i++) {
        if (i <= totalpage) {
            container.innerHTML += '<a href="SearchController?keyword=' + keyword + '&page=' + i + '&filterindex=' + filterindex + '#menu">' + i + '</a>';
        }
    }

    if (pageindex + gap < totalpage) {
        container.innerHTML += '<a href="SearchController?keyword=' + keyword + '&page=' + totalpage + '&filterindex=' + filterindex + '#menu">Last</a>';
    }

}

//Generate Paging Page Advance Search 
function generatePagerAdvanceSearchController(div, pageindex, totalpage, gap, filterindex, cateId, manuId, searchPrice) {
    var container = document.getElementById(div);
    if (pageindex - gap > 1) {
        container.innerHTML += '<a href="AdvanceSearchController?categoryId=' + cateId + '&manufacturerId=' + manuId + '&searchPrice=' + searchPrice + '&page=1&filterindex=' + filterindex + '#menu">First</a>';
    }

    for (var i = pageindex - gap; i < pageindex; i++) {
        if (i > 0) {
            container.innerHTML += '<a href="AdvanceSearchController?categoryId=' + cateId + '&manufacturerId=' + manuId + '&searchPrice=' + searchPrice + '&page=' + i + '&filterindex=' + filterindex + '#menu">' + i + '</a>';
        }
    }

    container.innerHTML += '<a href="#menu" class="target">' + pageindex + '</a>';

    for (var i = pageindex + 1; i < pageindex + gap; i++) {
        if (i <= totalpage) {
            container.innerHTML += '<a href="AdvanceSearchController?categoryId=' + cateId + '&manufacturerId=' + manuId + '&searchPrice=' + searchPrice + '&page=' + i + '&filterindex=' + filterindex + '#menu">' + i + '</a>';
        }
    }

    if (pageindex + gap < totalpage) {
        container.innerHTML += '<a href="AdvanceSearchController?categoryId=' + cateId + '&manufacturerId=' + manuId + '&searchPrice=' + searchPrice + '&page=' + totalpage + '&filterindex=' + filterindex + '#menu">Last</a>';
    }

}
//Generate Page News
function generatePaggerNews(div, pageindex, totalpage, gap) {
    var container = document.getElementById(div);
    if (pageindex - gap > 1) {
        container.innerHTML += '<a href="NewsListController?page=1#menu">First</a>';
    }

    for (var i = pageindex - gap; i < pageindex; i++) {
        if (i > 0) {
            container.innerHTML += '<a href="NewsListController?page=' + i + '#menu">' + i + '</a>';
        }
    }

    container.innerHTML += '<a href="#menu" class="target">' + pageindex + '</a>';

    for (var i = pageindex + 1; i < pageindex + gap; i++) {
        if (i <= totalpage) {
            container.innerHTML += '<a href="NewsListController?page=' + i + '#menu">' + i + '</a>';
        }
    }

    if (pageindex + gap < totalpage) {
        container.innerHTML += '<a href="NewsListController?page=' + totalpage + '#menu">Last</a>';
    }
}

