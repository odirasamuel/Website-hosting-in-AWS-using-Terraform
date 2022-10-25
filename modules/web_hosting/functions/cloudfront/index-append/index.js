// This is a cloudfront function that adds index.html to
// indices should support requests to paths by returning their index
// files.
function handler(event) {
    var request = event.request;
    var uri = request.uri;

    // Check whether the URI is missing a file name. this is the common
    // case for indexer requests.
    if (uri.endsWith('/')) {
        request.uri += 'index.html';
    }
    // Check whether the URI is missing a file extension. this would
    // happen more often from testing in a browser.
    else if (!uri.includes('.')) {
        request.uri += '/index.html';
    }

    return request;
}