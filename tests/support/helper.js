const btoa = require('btoa');


/**
* Function to convert string to base64 encoding < username:password >
* @param {string} username 
* @param {string} password 
*/
exports.base64encode = function (username, password) {
    return btoa(`${username}:${password}`)
}