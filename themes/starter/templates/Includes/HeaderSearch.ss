<% if $HeaderSearchForm %>
    <div class="site-header-search">
        <%-- $HeaderSearchForm --%>
        <form id="SearchForm_SearchForm" action="search/SearchForm" method="get"
            enctype="application/x-www-form-urlencoded"
            class="form-inline hidden-xs hidden-sm header-search pull-right"
            role="search"
        >
            <div class="input-group">
                <input name="Search" aria-label="search" type="text"
                    class="form-control st-default-search-input"
                    placeholder="Search..."
                    style="box-sizing:border-box"
                >
                <div class="input-group-btn">
                    <button type="submit" class="btn btn-default">
                        <i class="fa fa-search" aria-hidden="true"></i>
                        <span class="sr-only">Search</span>
                    </button>
                </div>
            </div>
        </form>
    </div>
<% end_if %>
