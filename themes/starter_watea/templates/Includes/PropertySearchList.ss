<% loop $Results %>
<div class="col-sm-6 col-md-6 col-lg-6">
    <!-- product -->
    <div class="product-content product-wrap clearfix">
        <div class="row">
            <div class="col-md-5 col-sm-12 col-xs-12">
                <div class="product-image">
                    <% if $PrimaryPhoto %>
                        $PrimaryPhoto.Fill(760,670)
                    <% else %>
	                    <img src="$PrimaryPhoto_URL" alt="$PrimaryPhoto_Title">
                    <% end_if %>
                    <ul class="amenities">
                        <li><i class="icon-bedrooms"></i> $Bedrooms</li>
                        <li><i class="icon-bathrooms"></i> $Bathrooms</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-7 col-sm-12 col-xs-12">
                <div class="property-list">
                    <h5 class="name">
                        <a href="$Link">
                            $Title
                            <span>
                                <% if $Region.Title %>
                                    $Region.Title
                                <% else %>
                                    $Region
                                <% end_if %>
                            </span>
                        </a>
                    </h5>
                    <p class="price-container">
                        <span>
                            <% if $PricePerNight.Nice %>
                                $PricePerNight.Nice
                            <% else %>
                                ${$PricePerNight}
                            <% end_if %>
                        </span>
                    </p>
                </div>
                <div class="description">
                    <p>$Description.FirstSentence()</p>
	                <p>
                        <% if $AvailableStart.Nice %>
                            $AvailableStart.Nice
                        <% else %>
                            $AvailableStart
                        <% end_if %>
                        -
                        <% if $AvailableEnd.Nice %>
                            $AvailableEnd.Nice
                        <% else %>
                            $AvailableEnd
                        <% end_if %>
                    </p>
                </div>
                <div class="product-info smart-form">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <a href="$Link" class="btn btn-info">Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end product -->
</div>
<% end_loop %>
