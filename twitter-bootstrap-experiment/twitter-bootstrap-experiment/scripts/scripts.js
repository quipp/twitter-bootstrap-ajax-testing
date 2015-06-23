/// <reference path="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0-vsdoc.js" />

function onSearchClick(sender, args) {
    $.ajax({
        type: 'POST',
        url: 'RealAjax.aspx/SearchMotorcycleByName',
        data: '{ searchText: "' + getSearchText() + '"}',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (responseText) {
            loadSearchResultsIntoList(responseText);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            displayAjaxError(xhr, ajaxOptions, thrownError);
        }
    });
}

var getSearchText = function () {
    return searchText = $find('SearchBox').get_value();
}

var loadSearchResultsIntoList = function (responseText) {
    var searchResults = $find('SearchResultsList');
    var items = searchResults.get_items();
    searchResults.trackChanges();

    items.clear();

    var foundMotorcycles = jQuery.parseJSON(responseText.d);
    var moto;
    for (var i = 0; i < foundMotorcycles.length; i++) {
        moto = new Telerik.Web.UI.RadListBoxItem();
        moto.set_text(foundMotorcycles[i].FullName);
        moto.set_value(foundMotorcycles[i].MotorcycleID);
        items.insert(0, moto);
    }

    searchResults.commitChanges();
}

var displayAjaxError = function (xhr, ajaxOptions, thrownError) {
    var errorMessage = alert(xhr.status + ' - ' + thrownError + '\n');
    try {
        var errorJSON = jQuery.parseJSON(xhr.response.Text);
        errorMessage += errorJSON.Message + '\n' + errorJSON.StackTrace;
    }
    catch (er) { }
    alert(errorMessage);
}

var onSaveClick = function (sender, args) {
    $.ajax({
        type: 'POST',
        url: 'RealAjax.aspx/SaveMotorcycleList',
        data: '{motorcycleListJson:\'' + JSON.stringify(getSelectedMotorcyclesJson()) + '\'}',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (responseText) {
            var result = jQuery.parseJSON(responseText.d);
            if (result.IsSuccess) {
                moveSelectedToSavedList();
            }
            else {
                alert(result.ErrorMessage);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            displayAjaxError(xhr, ajaxOptions, thrownError);
        }
    });
}

var moveSelectedToSavedList = function () {
    var selectedList = $find('SelectionResults');
    var selectedItems = selectedList.get_items();

    var savedList = $find('SavedItems');
    var savedItems = savedList.get_items();

    savedList.trackChanges();

    savedItems.clear();

    var savedMoto;
    for (var i = 0; i < selectedItems.get_count() ; i++) {
        savedMoto = new Telerik.Web.UI.RadListBoxItem();

        var selectedMoto = selectedList.getItem(i);
        savedMoto.set_text(selectedMoto.get_text());
        savedMoto.set_value(selectedMoto.get_value());
        savedItems.insert(0, savedMoto);
    }

    savedList.commitChanges();
}

var getSelectedMotorcyclesJson = function () {
    var searchResults = $find('SelectionResults');
    var items = searchResults.get_items();

    var selectedJson = [];
    for (var i = 0; i < items.get_count(); i++) {
        // Only need the motorcycle ID
        selectedJson.push(items.getItem(i).get_value());
    }

    return selectedJson;
}
