!function(n){function r(n){var r=n.length;if(!(2>r)){S.comboSyntax&&(E=S.comboSyntax),S.comboMaxLength&&(d=S.comboMaxLength),g=S.comboExcludes;for(var t=[],o=0;r>o;o++){var a=n[o];if(!b[a]){var u=_.get(a);u.status<p&&!s(a)&&!v(a)&&t.push(a)}}t.length>1&&f(e(t))}}function t(n){n.requestUri=b[n.uri]||n.uri}function e(n){return a(o(n))}function o(n){for(var r={__KEYS:[]},t=0,e=n.length;e>t;t++)for(var o=n[t].replace("://","__").split("/"),a=r,u=0,f=o.length;f>u;u++){var i=o[u];a[i]||(a[i]={__KEYS:[]},a.__KEYS.push(i)),a=a[i]}return r}function a(n){for(var r=[],t=n.__KEYS,e=0,o=t.length;o>e;e++){for(var a=t[e],f=a,i=n[a],h=i.__KEYS;1===h.length;)f+="/"+h[0],i=i[h[0]],h=i.__KEYS;h.length&&r.push([f.replace("__","://"),u(i)])}return r}function u(n){for(var r=[],t=n.__KEYS,e=0,o=t.length;o>e;e++){var a=t[e],f=u(n[a]),i=f.length;if(i)for(var h=0;i>h;h++)r.push(a+"/"+f[h]);else r.push(a)}return r}function f(n){for(var r=0,t=n.length;t>r;r++)for(var e=n[r],o=e[0]+"/",a=l(e[1]),u=0,f=a.length;f>u;u++)i(o,a[u]);return b}function i(n,r){var t=n+E[0]+r.join(E[1]),e=t.length>d;if(r.length>1&&e){var o=h(r,d-(n+E[0]).length);i(n,o[0]),i(n,o[1])}else{if(e)throw new Error("The combo url is too long: "+t);for(var a=0,u=r.length;u>a;a++)b[n+r[a]]=t}}function h(n,r){for(var t=E[1],e=n[0],o=1,a=n.length;a>o;o++)if(e+=t+n[o],e.length>r)return[n.splice(0,o),n]}function l(n){for(var r=[],t={},e=0,o=n.length;o>e;e++){var a=n[e],u=c(a);u&&(t[u]||(t[u]=[])).push(a)}for(var f in t)t.hasOwnProperty(f)&&r.push(t[f]);return r}function c(n){var r=n.lastIndexOf(".");return r>=0?n.substring(r):""}function s(n){return g?g.test?g.test(n):g(n):void 0}function v(n){var r=S.comboSyntax||["??",","],t=r[0],e=r[1];return t&&n.indexOf(t)>0||e&&n.indexOf(e)>0}var g,_=n.Module,p=_.STATUS.FETCHING,S=n.data,b=S.comboHash={},E=["??",","],d=2e3;n.on("load",r),n.on("fetch",t);define("seajs-combo",[],{})}(seajs);