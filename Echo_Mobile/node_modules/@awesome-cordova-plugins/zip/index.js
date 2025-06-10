var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
import { AwesomeCordovaNativePlugin, cordova } from '@awesome-cordova-plugins/core';
var ZipOriginal = /** @class */ (function (_super) {
    __extends(ZipOriginal, _super);
    function ZipOriginal() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    ZipOriginal.prototype.unzip = function (sourceZip, destFolder, onSuccess, onProgress) { return cordova(this, "unzip", {}, arguments); };
    ZipOriginal.pluginName = "Zip";
    ZipOriginal.plugin = "cordova-plugin-zip";
    ZipOriginal.pluginRef = "zip";
    ZipOriginal.repo = "https://github.com/MobileChromeApps/cordova-plugin-zip";
    ZipOriginal.platforms = ["Android", "iOS"];
    return ZipOriginal;
}(AwesomeCordovaNativePlugin));
var Zip = new ZipOriginal();
export { Zip };
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi8uLi9zcmMvQGF3ZXNvbWUtY29yZG92YS1wbHVnaW5zL3BsdWdpbnMvemlwL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7OztBQUFBLE9BQU8sdUNBQStDLE1BQU0sK0JBQStCLENBQUM7O0lBOEJuRSx1QkFBMEI7Ozs7SUFVakQsbUJBQUssYUFBQyxTQUFpQixFQUFFLFVBQWtCLEVBQUUsU0FBbUIsRUFBRSxVQUFxQjs7Ozs7O2NBeEN6RjtFQThCeUIsMEJBQTBCO1NBQXRDLEdBQUciLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgeyBBd2Vzb21lQ29yZG92YU5hdGl2ZVBsdWdpbiwgQ29yZG92YSwgUGx1Z2luIH0gZnJvbSAnQGF3ZXNvbWUtY29yZG92YS1wbHVnaW5zL2NvcmUnO1xuXG5pbXBvcnQgeyBJbmplY3RhYmxlIH0gZnJvbSAnQGFuZ3VsYXIvY29yZSc7XG5cbi8qKlxuICogQG5hbWUgWmlwXG4gKiBAZGVzY3JpcHRpb25cbiAqIEEgQ29yZG92YSBwbHVnaW4gdG8gdW56aXAgZmlsZXMgaW4gQW5kcm9pZCBhbmQgaU9TLlxuICogQHVzYWdlXG4gKiBgYGB0eXBlc2NyaXB0XG4gKiBpbXBvcnQgeyBaaXAgfSBmcm9tICdAYXdlc29tZS1jb3Jkb3ZhLXBsdWdpbnMvemlwL254J1xuICogLi4uXG4gKlxuICogY29uc3QgcmVzdWx0ID0gYXdhaXQgWmlwLnVuemlwKCdwYXRoL3RvL3NvdXJjZS56aXAnLCAncGF0aC90by9kZXN0JywgKHByb2dyZXNzKSA9PlxuICogICAgIGNvbnNvbGUubG9nKCdVbnppcHBpbmcsICcgKyBNYXRoLnJvdW5kKChwcm9ncmVzcy5sb2FkZWQgLyBwcm9ncmVzcy50b3RhbCkgKiAxMDApICsgJyUnKVxuICogKTtcbiAqXG4gKiBpZihyZXN1bHQgPT09IDApIGNvbnNvbGUubG9nKCdTVUNDRVNTJyk7XG4gKiBpZihyZXN1bHQgPT09IC0xKSBjb25zb2xlLmxvZygnRkFJTEVEJyk7XG4gKlxuICogYGBgXG4gKi9cbkBQbHVnaW4oe1xuICBwbHVnaW5OYW1lOiAnWmlwJyxcbiAgcGx1Z2luOiAnY29yZG92YS1wbHVnaW4temlwJyxcbiAgcGx1Z2luUmVmOiAnemlwJyxcbiAgcmVwbzogJ2h0dHBzOi8vZ2l0aHViLmNvbS9Nb2JpbGVDaHJvbWVBcHBzL2NvcmRvdmEtcGx1Z2luLXppcCcsXG4gIHBsYXRmb3JtczogWydBbmRyb2lkJywgJ2lPUyddLFxufSlcbkBJbmplY3RhYmxlKClcbmV4cG9ydCBjbGFzcyBaaXAgZXh0ZW5kcyBBd2Vzb21lQ29yZG92YU5hdGl2ZVBsdWdpbiB7XG4gIC8qKlxuICAgKiBFeHRyYWN0cyBmaWxlcyBmcm9tIGEgWklQIGFyY2hpdmVcbiAgICogQHBhcmFtIHtzdHJpbmd9IHNvdXJjZVppcCAgU291cmNlIFpJUCBmaWxlXG4gICAqIEBwYXJhbSB7c3RyaW5nfSBkZXN0Rm9sZGVyIERlc3RpbmF0aW9uIGZvbGRlclxuICAgKiBAcGFyYW0ge0Z1bmN0aW9ufSBvblN1Y2Nlc3MgICBjYWxsYmFjayB0byBiZSBjYWxsZWQgb24gd2hlbiBkb25lXG4gICAqIEBwYXJhbSB7RnVuY3Rpb259IG9uUHJvZ3Jlc3MgIG9wdGlvbmFsIGNhbGxiYWNrIHRvIGJlIGNhbGxlZCBvbiBwcm9ncmVzcyB1cGRhdGVcbiAgICogQHJldHVybnMge1Byb21pc2U8bnVtYmVyPn0gcmV0dXJucyBhIHByb21pc2UgdGhhdCByZXNvbHZlcyB3aXRoIGEgbnVtYmVyLiAwIGlzIHN1Y2Nlc3MsIC0xIGlzIGVycm9yXG4gICAqL1xuICBAQ29yZG92YSgpXG4gIHVuemlwKHNvdXJjZVppcDogc3RyaW5nLCBkZXN0Rm9sZGVyOiBzdHJpbmcsIG9uU3VjY2VzczogRnVuY3Rpb24sIG9uUHJvZ3Jlc3M/OiBGdW5jdGlvbik6IFByb21pc2U8bnVtYmVyPiB7XG4gICAgcmV0dXJuO1xuICB9XG59XG4iXX0=