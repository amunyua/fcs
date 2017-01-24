/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
var rootPath
CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';

    config.filebrowserBrowseUrl = "/Scripts/ckeditor/filemanager/browser/default/browser.html?Type=Image&Connector=/Scripts/ckeditor/filemanager/connectors/asp/connector.asp";
    config.filebrowserWindowWidth = 500;
    config.filebrowserWindowHeight = 650;
    config.filebrowserUploadUrl = "/Uploads/Upload";
};
