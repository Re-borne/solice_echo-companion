'use strict';

var tslib = require('tslib');
var core = require('@awesome-cordova-plugins/core');
var i0 = require('@angular/core');

function _interopNamespaceDefault(e) {
    var n = Object.create(null);
    if (e) {
        Object.keys(e).forEach(function (k) {
            if (k !== 'default') {
                var d = Object.getOwnPropertyDescriptor(e, k);
                Object.defineProperty(n, k, d.get ? d : {
                    enumerable: true,
                    get: function () { return e[k]; }
                });
            }
        });
    }
    n.default = e;
    return Object.freeze(n);
}

var i0__namespace = /*#__PURE__*/_interopNamespaceDefault(i0);

var Zip = /** @class */ (function (_super) {
    tslib.__extends(Zip, _super);
    function Zip() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Zip.prototype.unzip = function (sourceZip, destFolder, onSuccess, onProgress) { return core.cordova(this, "unzip", {}, arguments); };
    Zip.ɵfac = i0__namespace.ɵɵngDeclareFactory({ minVersion: "12.0.0", version: "12.2.17", ngImport: i0__namespace, type: Zip, deps: null, target: i0__namespace.ɵɵFactoryTarget.Injectable });
    Zip.ɵprov = i0__namespace.ɵɵngDeclareInjectable({ minVersion: "12.0.0", version: "12.2.17", ngImport: i0__namespace, type: Zip });
    Zip.pluginName = "Zip";
    Zip.plugin = "cordova-plugin-zip";
    Zip.pluginRef = "zip";
    Zip.repo = "https://github.com/MobileChromeApps/cordova-plugin-zip";
    Zip.platforms = ["Android", "iOS"];
    Zip = tslib.__decorate([], Zip);
    return Zip;
}(core.AwesomeCordovaNativePlugin));
i0__namespace.ɵɵngDeclareClassMetadata({ minVersion: "12.0.0", version: "12.2.17", ngImport: i0__namespace, type: Zip, decorators: [{
            type: i0.Injectable
        }], propDecorators: { unzip: [] } });

exports.Zip = Zip;
