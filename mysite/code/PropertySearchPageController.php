<?php

namespace Acme;

use PageController;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FormAction;
use SilverStripe\ORM\ArrayLib;
use SilverStripe\Control\HTTPRequest;

class PropertySearchPageController extends PageController
{

    public function index(HTTPRequest $request)
    {
        $properties = Property::get();

        if ($search = $request->getVar('Keywords')) {
            $properties = $properties->filter(array(
                'Title:PartialMatch' => $search
            ));
        }

        if ($arrival = $request->getVar('ArrivalDate')) {
            $arrivalStamp = strtotime($arrival);
            $nightAdder = '+'.$request->getVar('Nights').' days';
            $startDate = date('Y-m-d', $arrivalStamp);
            $endDate = date('Y-m-d', strtotime($nightAdder, $arrivalStamp));
            $properties = $properties->filter([
                'AvailableStart:LessThanOrEqual' => $startDate,
                'AvailableEnd:GreaterThanOrEqual' => $endDate
            ]);

        }

        $filters = [
            ['Bedrooms', 'Bedrooms', 'GreaterThanOrEqual'],
            ['Bathrooms', 'Bathrooms', 'GreaterThanOrEqual'],
            ['MinPrice', 'PricePerNight', 'GreaterThanOrEqual'],
            ['MaxPrice', 'PricePerNight', 'LessThanOrEqual'],
        ];

        foreach($filters as $filterKeys) {
            list($getVar, $field, $filter) = $filterKeys;
            if ($value = $request->getVar($getVar)) {
                $properties = $properties->filter([
                    "{$field}:{$filter}" => $value
                ]);
            }
        }

        if ($regionIds = $request->getVar('RegionID')) {
            $properties = $properties->filter('RegionID', $regionIds);
        }

        return [
            'Results' => $properties
        ];
    }

    public function PropertySearchForm()
    {
        $nights = [];
        foreach(range(1,14) as $i) {
            $nights[$i] = "$i night" . (($i > 1) ? 's' : '');
        }
        $prices = [];
        foreach(range(100, 1000, 50) as $i) {
            $prices[$i] = '$'.$i;
        }

        $form = Form::create(
            $this,
            'PropertySearchForm',
            FieldList::create(
                TextField::create('Keywords')->setAttribute('placeholder', 'Please type here...'),
                TextField::create('ArrivalDate','Arrival date'),
                DropdownField::create('Nights', 'No. of nights')->setEmptyString('-- any --')->setSource($nights),
                DropdownField::create('Bedrooms', 'No. of bedrooms')->setEmptyString('-- any --')->setSource(ArrayLib::valuekey(range(1,5))),
                DropdownField::create('Bathrooms', 'No. of bathrooms')->setEmptyString('-- any --')->setSource(ArrayLib::valuekey(range(1,5))),
                DropdownField::create('MinPrice', 'Min. price')->setEmptyString('-- any --')->setSource($prices),
                DropdownField::create('MaxPrice', 'Max. price')->setEmptyString('-- any --')->setSource($prices),
                CheckboxSetField::create('RegionID', 'Regions', Region::get()->map('ID', 'Title'))
            ),
            FieldList::create(
                FormAction::create('doPropertySearch','Search')->addExtraClass('btn-lg btn-primary')
            )
        );

        $form->setFormMethod('GET')
            ->setFormAction($this->Link())
            ->disableSecurityToken()
            ->loadDataFrom($this->request->getVars());

        return $form;
    }
}
