import { __decorate, __extends } from "tslib";
import { AwesomeCordovaNativePlugin, cordova } from '@awesome-cordova-plugins/core';
import { Injectable } from '@angular/core';
import * as i0 from "@angular/core";
var Zip = /** @class */ (function (_super) {
    __extends(Zip, _super);
    function Zip() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Zip.prototype.unzip = function (sourceZip, destFolder, onSuccess, onProgress) { return cordova(this, "unzip", {}, arguments); };
    Zip.ɵfac = i0.ɵɵngDeclareFactory({ minVersion: "12.0.0", version: "12.2.17", ngImport: i0, type: Zip, deps: null, target: i0.ɵɵFactoryTarget.Injectable });
    Zip.ɵprov = i0.ɵɵngDeclareInjectable({ minVersion: "12.0.0", version: "12.2.17", ngImport: i0, type: Zip });
    Zip.pluginName = "Zip";
    Zip.plugin = "cordova-plugin-zip";
    Zip.pluginRef = "zip";
    Zip.repo = "https://github.com/MobileChromeApps/cordova-plugin-zip";
    Zip.platforms = ["Android", "iOS"];
    Zip = __decorate([], Zip);
    return Zip;
}(AwesomeCordovaNativePlugin));
export { Zip };
i0.ɵɵngDeclareClassMetadata({ minVersion: "12.0.0", version: "12.2.17", ngImport: i0, type: Zip, decorators: [{
            type: Injectable
        }], propDecorators: { unzip: [] } });
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi8uLi8uLi9zcmMvQGF3ZXNvbWUtY29yZG92YS1wbHVnaW5zL3BsdWdpbnMvemlwL25neC9pbmRleC50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiO0FBQUEsT0FBTyx1Q0FBK0MsTUFBTSwrQkFBK0IsQ0FBQztBQUU1RixPQUFPLEVBQUUsVUFBVSxFQUFFLE1BQU0sZUFBZSxDQUFDOzs7SUE0QmxCLHVCQUEwQjs7OztJQVVqRCxtQkFBSyxhQUFDLFNBQWlCLEVBQUUsVUFBa0IsRUFBRSxTQUFtQixFQUFFLFVBQXFCO3FHQVY1RSxHQUFHO3lHQUFILEdBQUc7Ozs7OztJQUFILEdBQUcsa0JBQUgsR0FBRztjQTlCaEI7RUE4QnlCLDBCQUEwQjtTQUF0QyxHQUFHOzRGQUFILEdBQUc7a0JBRGYsVUFBVTs4QkFXVCxLQUFLIiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IHsgQXdlc29tZUNvcmRvdmFOYXRpdmVQbHVnaW4sIENvcmRvdmEsIFBsdWdpbiB9IGZyb20gJ0Bhd2Vzb21lLWNvcmRvdmEtcGx1Z2lucy9jb3JlJztcblxuaW1wb3J0IHsgSW5qZWN0YWJsZSB9IGZyb20gJ0Bhbmd1bGFyL2NvcmUnO1xuXG4vKipcbiAqIEBuYW1lIFppcFxuICogQGRlc2NyaXB0aW9uXG4gKiBBIENvcmRvdmEgcGx1Z2luIHRvIHVuemlwIGZpbGVzIGluIEFuZHJvaWQgYW5kIGlPUy5cbiAqIEB1c2FnZVxuICogYGBgdHlwZXNjcmlwdFxuICogaW1wb3J0IHsgWmlwIH0gZnJvbSAnQGF3ZXNvbWUtY29yZG92YS1wbHVnaW5zL3ppcC9ueCdcbiAqIC4uLlxuICpcbiAqIGNvbnN0IHJlc3VsdCA9IGF3YWl0IFppcC51bnppcCgncGF0aC90by9zb3VyY2UuemlwJywgJ3BhdGgvdG8vZGVzdCcsIChwcm9ncmVzcykgPT5cbiAqICAgICBjb25zb2xlLmxvZygnVW56aXBwaW5nLCAnICsgTWF0aC5yb3VuZCgocHJvZ3Jlc3MubG9hZGVkIC8gcHJvZ3Jlc3MudG90YWwpICogMTAwKSArICclJylcbiAqICk7XG4gKlxuICogaWYocmVzdWx0ID09PSAwKSBjb25zb2xlLmxvZygnU1VDQ0VTUycpO1xuICogaWYocmVzdWx0ID09PSAtMSkgY29uc29sZS5sb2coJ0ZBSUxFRCcpO1xuICpcbiAqIGBgYFxuICovXG5AUGx1Z2luKHtcbiAgcGx1Z2luTmFtZTogJ1ppcCcsXG4gIHBsdWdpbjogJ2NvcmRvdmEtcGx1Z2luLXppcCcsXG4gIHBsdWdpblJlZjogJ3ppcCcsXG4gIHJlcG86ICdodHRwczovL2dpdGh1Yi5jb20vTW9iaWxlQ2hyb21lQXBwcy9jb3Jkb3ZhLXBsdWdpbi16aXAnLFxuICBwbGF0Zm9ybXM6IFsnQW5kcm9pZCcsICdpT1MnXSxcbn0pXG5ASW5qZWN0YWJsZSgpXG5leHBvcnQgY2xhc3MgWmlwIGV4dGVuZHMgQXdlc29tZUNvcmRvdmFOYXRpdmVQbHVnaW4ge1xuICAvKipcbiAgICogRXh0cmFjdHMgZmlsZXMgZnJvbSBhIFpJUCBhcmNoaXZlXG4gICAqIEBwYXJhbSB7c3RyaW5nfSBzb3VyY2VaaXAgIFNvdXJjZSBaSVAgZmlsZVxuICAgKiBAcGFyYW0ge3N0cmluZ30gZGVzdEZvbGRlciBEZXN0aW5hdGlvbiBmb2xkZXJcbiAgICogQHBhcmFtIHtGdW5jdGlvbn0gb25TdWNjZXNzICAgY2FsbGJhY2sgdG8gYmUgY2FsbGVkIG9uIHdoZW4gZG9uZVxuICAgKiBAcGFyYW0ge0Z1bmN0aW9ufSBvblByb2dyZXNzICBvcHRpb25hbCBjYWxsYmFjayB0byBiZSBjYWxsZWQgb24gcHJvZ3Jlc3MgdXBkYXRlXG4gICAqIEByZXR1cm5zIHtQcm9taXNlPG51bWJlcj59IHJldHVybnMgYSBwcm9taXNlIHRoYXQgcmVzb2x2ZXMgd2l0aCBhIG51bWJlci4gMCBpcyBzdWNjZXNzLCAtMSBpcyBlcnJvclxuICAgKi9cbiAgQENvcmRvdmEoKVxuICB1bnppcChzb3VyY2VaaXA6IHN0cmluZywgZGVzdEZvbGRlcjogc3RyaW5nLCBvblN1Y2Nlc3M6IEZ1bmN0aW9uLCBvblByb2dyZXNzPzogRnVuY3Rpb24pOiBQcm9taXNlPG51bWJlcj4ge1xuICAgIHJldHVybjtcbiAgfVxufVxuIl19