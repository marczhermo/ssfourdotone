<% loop $Results %>
<div class="col-sm-6 col-md-6 col-lg-6">
    <!-- product -->
    <div class="product-content product-wrap clearfix">
        <div class="row">
            <div class="col-md-5 col-sm-12 col-xs-12">
                <div class="product-image">
	                <img src="$PrimaryPhoto_URL" alt="$PrimaryPhoto">
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
                            <span>$Region.Title</span>
                        </a>
                    </h5>
                    <p class="price-container">
                        <span>$PricePerNight.Nice</span>
                    </p>
                </div>
                <div class="description">
                    <p>$Description.FirstSentence()</p>
	                <p>$AvailableStart.Nice - $AvailableEnd.Nice</p>
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