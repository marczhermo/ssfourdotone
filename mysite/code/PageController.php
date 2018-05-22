<?php

use SilverStripe\CMS\Controllers\ContentController;
use Marcz\Search\Config;
use SilverStripe\ORM\ArrayList;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FormAction;

class PageController extends ContentController
{
    /**
     * An array of actions that can be accessed via a request. Each array element should be an action name, and the
     * permissions or conditions required to allow the user to access it.
     *
     * <code>
     * [
     *     'action', // anyone can access this action
     *     'action' => true, // same as above
     *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
     *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
     * ];
     * </code>
     *
     * @var array
     */
    private static $allowed_actions = ['HeaderSearchForm'];

    protected function init()
    {
        parent::init();
        // You can include any CSS or JS required by your project here.
        // See: https://docs.silverstripe.org/en/developer_guides/templates/requirements/
    }

    public function HeaderSearchForm()
    {
        $fields = new FieldList(
            TextField::create('Search', 'Search...')
                ->addExtraClass('st-default-search-input')
        );

        $actions = FieldList::create(
            FormAction::create('doPropertySearch', 'Search')
                ->addExtraClass('btn btn-default')
        );

        $form = new Form($this, 'HeaderSearchForm', $fields, $actions);
        $form->setFormMethod('GET')
            ->setFormAction($this->Link())
            ->disableSecurityToken();

        return $form;
    }
}
