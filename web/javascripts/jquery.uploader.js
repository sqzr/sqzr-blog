/*! nice Uploader 0.1.0
 * (c) 2012-2013 Jony Zhang <zj86@live.cn>, MIT Licensed
 * http://niceue.com/uploader/
 */
!
    function (e, t, i) {
        function o(e) {
            var t = -1;
            if (e) {
                do e /= 1024,
                    t++;
                while (e > 1024)
            } else t++,
                e = 0;
            return e.toFixed(2) + ["KB", "M", "G", "T"][t]
        }

        function n(e) {
            var t, i = {
                k: 1024,
                m: 1048576,
                g: 1073741824
            };
            return "string" == typeof e && (t = /([0-9\.]+)([mgk])/.exec(e.toLowerCase()), e = +t[1], e *= i[t[2]]),
                e
        }

        function a(e, t) {
            var i, o, n = e.length;
            return n > t && (o = 5 + (n - e.lastIndexOf(".") - 1), i = t - o - 3, i % 2 && (i -= 1), e = e.substr(0, i) + "..." + e.substr(-o)),
                e
        }

        function s(e) {
            if (!e) return "";
            if ("object" == typeof e) return t.extend(c, e);
            var i = c[e] || e,
                o = arguments;
            if (o.length > 1) for (var n = 1,
                                       a = o.length; a > n; n++) i = i.replace("{" + n + "}", o[n]);
            return i
        }

        var r = "uploader",
            l = r + 1e17 * Math.random(),
            u = t.noop,
            p = {
                mode: "html5",
                action: "",
                name: "file",
                formData: null,
                multiple: !1,
                auto: !0,
                showQueue: !1,
                fileSizeLimit: 0,
                fileTypeDesc: "",
                fileTypeExts: "",
                maxChunkSize: 512e3,
                maxConnections: 2,
                preview: !1,
                onInit: u,
                onClearQueue: u,
                onSelected: u,
                onCancel: u,
                onError: u,
                onStart: u,
                onProgress: u,
                onSuccess: u,
                onComplete: u,
                onAllComplete: u,
                onMouseOver: u,
                onMouseOut: u,
                onMouseClick: u,
                onAddQueue: function (e, t) {
                    var i = "<ul>";
                    return this.options.preview && (i += '<li class="f-preview" id="' + this.id + "_preview_" + e.id + '"></li>'),
                        i += '<li class="f-name" title="' + e.name + '">' + a(e.name, 32) + '</li>                    <li class="f-size">' + o(e.size) + '</li>                    <li class="f-progress">' + (t ? t.name : "") + '</li>                    <li class="f-operate"><a href="#" class="upload-cancel">&times;</a></li>                    </ul>                    <div class="f-progress-bg"></div>'
                }
            },
            c = {
                600: "Installation error",
                601: 'Please select "{1}" format file',
                602: "The file size must be less than {1}"
            },
            d = {};
        !
            function (e) {
                var t, i, o, n = e.split(/,/);
                for (t = 0; t < n.length; t += 2) for (o = n[t + 1].split(/ /), i = 0; i < o.length; i++) d[o[i]] = n[t]
            }("image/x-icon,ico,image/bmp,bmp,image/gif,gif,image/jpeg,jpeg jpg jpe,image/photoshop,psd,image/png,png,image/svg+xml,svg svgz,image/tiff,tiff tif,text/plain,asc txt text diff log,text/html,htm html xhtml,text/xml,xml,text/css,css,text/csv,csv,text/rtf,rtf,audio/mpeg,mpga mpega mp2 mp3,audio/x-wav,wav,audio/mp4,m4a,audio/ogg,oga,audio/webm,webma,video/mpeg,mpeg mpg mpe,video/quicktime,qt mov,video/mp4,mp4,video/x-m4v,m4v,video/x-flv,flv,video/x-ms-wmv,wmv,video/avi,avi,video/ogg,ogv,video/webm,webmv,video/vnd.rn-realvideo,rv,application/msword,doc dot,application/pdf,pdf,application/pgp-signature,pgp,application/postscript,ps ai eps,application/rtf,rtf,application/vnd.ms-excel,xls xlb,application/vnd.ms-powerpoint,ppt pps pot,application/zip,zip,application/x-rar-compressed,rar,application/x-shockwave-flash,swf swfl,application/vnd.openxmlformats-officedocument.wordprocessingml.document,docx,application/vnd.openxmlformats-officedocument.wordprocessingml.template,dotx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,xlsx,application/vnd.openxmlformats-officedocument.presentationml.presentation,pptx,application/vnd.openxmlformats-officedocument.presentationml.template,potx,application/vnd.openxmlformats-officedocument.presentationml.slideshow,ppsx,application/x-javascript,js,application/json,json,application/java-archive,jar war ear,application/vnd.oasis.opendocument.formula-template,otf,application/octet-stream,exe");
        var f = function () {
        };
        f.extend = function (e) {
            var t, i, o, n, a = this.prototype,
                s = a;
            for ("function" == typeof e && (e = e.call(a)), o = e.__construct; !o;) o = s.constructor,
                s = s.__super();
            i = new this("!-");
            for (n in e) i[n] = e[n];
            return t = function () {
                "!-" !== arguments[0] && o.apply(this, arguments)
            },
                i.constructor = t,
                i.__super = function (e, t) {
                    return e ? a[e].apply(this, t ? t : arguments.callee.caller.arguments) : a
                },
                t.prototype = i,
                t.extend = arguments.callee,
                t
        };
        var h = f.extend(function () {
            function a(e, t, i) {
                var o, n = "progress" === t;
                e && e.timeStamp ? (o = e.timeStamp, String(o).length > 13 && (o = +String(o).substr(0, 13))) : o = +new Date,
                    this.timeStamp = o,
                    this.type = t,
                    this.loaded = n ? e.loaded : 0,
                    this.total = n ? e.total : 0,
                    this.lengthComputable = n ? e.lengthComputable : !1,
                    this.file = i || e.file,
                n && (this.originalEvent = e),
                e.data && (this.data = e.data)
            }

            function u(e, t) {
                this.id = e,
                    this.name = t.name,
                    this.size = t.size,
                    this.type = t.type ? t.type.length < 6 ? d[t.type] : t.type : d[t.name.split(".").pop()],
                    this.lastModifiedDate = new Date(+t.lastModifiedDate),
                    this.originalFile = t,
                t.error && (this.error = t.error)
            }

            function p(e) {
                var t = e.code || +e.message,
                    i = {
                        600: "Installation Error",
                        601: "Type Error",
                        602: "Size Error"
                    };
                t && (this.code = t, e.name = e.name || i[t] || "HTTP Error", e.message = e.message || t),
                e.file && (this.file = e.file),
                    this.type = "error",
                    this.name = s(e.name || "Error"),
                    this.message = e.params ? s.apply(null, [e.message].concat(e.params)) : s(e.message)
            }

            function c(e) {
                for (var t = this.queue,
                         i = t.length; i--;) if (t[i].id === e) return t[i]
            }

            function f(e) {
                var t = e.substr(e.lastIndexOf(".") + 1).toLowerCase();
                return this.acceptExts[t]
            }

            function m(e, t) {
                return o(1e3 * e / t) + "/s"
            }

            function v(e, i) {
                var o = t("#" + this.id + "___" + e.id),
                    n = o.find(".f-progress-bg");
                n.animate({
                        width: i
                    },
                    200),
                    o.find(".f-progress").text(i),
                "100%" === i && n.delay(2e3).fadeOut(800,
                    function () {
                        o.remove()
                    })
            }

            return {
                __construct: function (t, o) {
                    var n, a = t[l],
                        s = r + "_";
                    a !== i ? (s += a, n = e[s], n && n.destroy()) : (a = h.guid++, s += a, t[l] = a),
                        this.id = s,
                        this.options = o,
                        this.element = t,
                        this.init(),
                        e[s] = this
                },
                init: function () {
                    var e = this,
                        i = t(e.element),
                        o = e.options,
                        n = i.outerWidth(),
                        a = i.outerHeight(),
                        s = "width:" + n + "px;height:" + a + "px;",
                        r = "z-index:" + i.css("z-index") + ";",
                        l = "margin:0;padding:0;border:0;cursor:pointer;font-size:200px;filter:alpha(opacity=0);opacity:0;";
                    o.showQueue && ("string" == typeof o.showQueue ? e.$queue = t(o.showQueue).addClass("upload-queue") : (i.after('<div class="upload-queue" id="' + e.id + '_queue"></div>'), e.$queue = t("#" + e.id + "_queue")), o.preview && e.$queue.addClass("upload-preview"));
                    var u = i.css("left"),
                        p = i.css("top"),
                        c = i.css("margin-left"),
                        d = i.css("margin-top");
                    "absolute" === i.css("position") ? r += "left:" + u + ";top:" + p + ";margin-left:" + c + ";margin-top:" + d + ";" : (r += "margin-left:-" + (n + (0 ^ parseInt(i.css("margin-right"))) + 0 ^ parseInt(u)) + "px;", r += "margin-top:" + (0 ^ parseInt(d) + 0 ^ parseInt(p)) + "px;"),
                        e.$browseEl = t('<span class="upload-el" style="position:absolute;overflow:hidden;' + s + r + '">' + e.create(l + s) + "</span>"),
                        i.after(e.$browseEl),
                        e.$el = i,
                        e.browse = t("#" + e.id)[0],
                        e.queue = [],
                        e.loadIndex = -1,
                        e.acceptExts = function (e) {
                            if ("*" === e) return e;
                            var i = {};
                            return t.each(e.split("|").join(",").split(","),
                                function (e, t) {
                                    i[t] = 1
                                }),
                                i
                        }(o.fileTypeExts),
                        o.onInit.call(e)
                },
                setOption: function (e, i) {
                    var o = this.options;
                    "string" == typeof e ? o[e] = i : "object" == typeof e && t.extend(o, e)
                },
                start: function () {
                    var e, t = this,
                        i = t.queue.length;
                    t.loadIndex++,
                        t.loadCount === i ? t.onAllComplete() : t.loadIndex < i && (e = t.queue[t.loadIndex], e.error || e.abort ? t.start() : t.upload(e))
                },
                remove: function (e) {
                    this.$queue && t("#" + this.id + "___" + e).delay(1e3).fadeOut(500).remove()
                },
                destroy: function () {
                    this.$browseEl && this.$browseEl.remove(),
                    this.$queue && this.$queue.remove(),
                        delete e[this.id]
                },
                getFile: function (e) {
                    return this.validId(e) ? this.files[e] : null
                },
                validId: function (e) {
                    for (var t = this.queue.length; t--;) if (this.queue[t].id === e) return !0
                },
                getDataURL: function (t) {
                    var i = this;
                    if (e.File && t instanceof File) {
                        if (e.FileReader) {
                            var o = new FileReader;
                            o.onload = function () {
                                t.dt = this.result,
                                    i.setPreview(t)
                            },
                                o.readAsDataURL(t)
                        }
                    } else t.dt && /^data:.*;base64/i.test(t.dt) && i.setPreview(t)
                },
                setPreview: function (e) {
                    t("#" + this.id + "_preview_" + e.id).html('<img src="' + e.dt + '">')
                },
                onSelected: function (e) {
                    var i, o = this,
                        a = o.options,
                        s = a.fileTypeExts.split("|").join(","),
                        r = n(a.fileSizeLimit);
                    if (o.queue = [], o.files = {},
                            o.loadIndex = -1, o.loadCount = 0, t.each(e,
                            function (e, t) {
                                var n;
                                return i = new u(+e, t),
                                    t.id = e,
                                a.preview && o.getDataURL(t),
                                    "*" === o.acceptExts || f.call(o, t.name) ? (r > 0 && i.size > r && (i.error = "Size Error", n = new p({
                                        code: 602,
                                        params: [a.fileSizeLimit.toUpperCase()],
                                        file: i
                                    }), o.onError(n, !1)), o.files[e] = t, void(o.queue[e] = i)) : void o.onError({
                                            code: 601,
                                            params: [s]
                                        },
                                        !1)
                            }), a.onSelected.call(o, o.queue) !== !1) {
                        if (o.$queue) {
                            var l = "",
                                c = o.queue.length;
                            t.each(o.queue,
                                function (e, t) {
                                    l += '<div class="queue' + (e + 1 === c ? " last-queue" : "") + (t.error ? " upload-error" : "") + '" id="' + o.id + "___" + e + '">',
                                        l += a.onAddQueue.call(o, t, t.error) + "</div>"
                                }),
                                o.$queue.html(l)
                        }
                        a.auto && o.start()
                    }
                },
                onStart: function (e) {
                    var t = this,
                        i = e.file;
                    e = new a(e, "loadstart", i),
                        e.originalFile = t.files[i.id],
                        i._t = e.timeStamp - 1,
                        i._l = 0,
                        h.uploading = !0,
                        t.options.onStart.call(t, e)
                },
                onProgress: function (e) {
                    var t = this,
                        i = e.file || t.queue[e.id];
                    e = new a(e, "progress", i),
                        e.originalFile = t.files[i.id],
                    e.lengthComputable && (e.speed = m(e.loaded - i._l, e.timeStamp - i._t), t.$queue && v.call(t, i, Math.round(100 * e.loaded / e.total).toFixed(1) + "%"), i._t = e.timeStamp, i._l = e.loaded),
                        t.options.onProgress.call(t, e)
                },
                onCancel: function (e) {
                    this.remove(e),
                        this.queue[e].abort = !0,
                        this.options.onCancel.call(this, this.queue[e])
                },
                onClearQueue: function () {
                    this.queue = [],
                    this.$queue && (this.$queue[0].innerHTML = ""),
                        this.browse.style.display = "",
                        h.uploading = !1,
                        this.options.onClearQueue.call(this)
                },
                onError: function (e, i) {
                    var o = this.options,
                        n = e.id || null,
                        a = n ? e.file || c.call(this, n) : null;
                    e.file = a,
                        e = new p(e),
                    o.language && e.code && o.language[e.code] && (e.message = o.language[e.code]),
                    null !== n && (this.$queue && t("#" + this.id + "___" + n).addClass("upload-error").find(".f-progress").text(e.name), i !== !1 && this.onComplete(e)),
                        this.options.onError.call(this, e)
                },
                onSuccess: function (e) {
                    e = new a(e, "load", this.queue[e.id]),
                        v.call(this, e.file, "100%"),
                        this.options.onSuccess.call(this, e),
                        this.onComplete(e)
                },
                onComplete: function (e) {
                    e = new a(e, "loadend"),
                        this.loadCount++,
                        this.options.onComplete.call(this, e),
                        this.start()
                },
                onAllComplete: function () {
                    var e = this;
                    h.uploading = !1,
                        e.files = {},
                        e.queue = [],
                        e.options.onAllComplete.call(e)
                },
                onMouseOver: function () {
                    this.$el.addClass("upload-btn-over"),
                        this.options.onMouseOver.call(this, this.$btn)
                },
                onMouseOut: function () {
                    this.$el.removeClass("upload-btn-over"),
                        this.options.onMouseOut.call(this, this.$btn)
                },
                onMouseClick: function () {
                    this.$el.trigger("click"),
                        this.options.onMouseClick.call(this, this.$btn)
                }
            }
        });
        e.FormData && (new XMLHttpRequest).upload && (h.html5 = h.extend(function () {
            function e() {
                var e, t, i = [],
                    o = this.options.fileTypeExts.replace("|", ",").split(","),
                    n = o.length;
                if (n) {
                    for (e = 0; n > e; e++) t = o[e],
                    d[t] && i.push("csv" === t ? ".csv" : d[t]);
                    return i.join(",")
                }
            }

            function o() {
                return this.xhr = this.xhr || new XMLHttpRequest,
                    this.xhr
            }

            var n = {
                loadstart: "onStart",
                progress: "onProgress",
                error: "onError",
                load: "onSuccess",
                loadend: "onComplete"
            };
            return {
                create: function (t) {
                    return '<input type="file" title="" class="uploader" id="' + this.id + '" style="' + t + '" accept="' + e.call(this) + '"' + (this.options.multiple ? " multiple" : "") + ">"
                },
                upload: function (e) {
                    var i, a, s, r = this,
                        l = r.options;
                    s = e.originalFile,
                    s && (a = new FormData, a.append(l.name, s), l.formData && t.each(t.isFunction(l.formData) ? l.formData.call(r) : l.formData,
                        function (e, t) {
                            a.append(e, t)
                        }), i = o.call(r), i.open(l.method || "POST", l.action, !0), i.onreadystatechange = function () {
                        4 === i.readyState && (200 === i.status ? r.onSuccess({
                            file: e,
                            data: i.responseText
                        }) : r.onError({
                            file: e,
                            code: i.status
                        }))
                    },
                        i.upload.onloadstart = i.upload.onprogress = i.upload.onerror = function (t) {
                            t.file = e,
                                r[n[t.type]](t)
                        },
                        t.each({
                                "Cache-Control": "no-cache",
                                "X-Requested-With": "XMLHttpRequest"
                            },
                            function (e, t) {
                                i.setRequestHeader(e, t)
                            }), i.withCredentials = !0, i.send(a))
                },
                cancel: function (e) {
                    var t = this,
                        o = t.queue;
                    if (e === i || "*" === e) t.xhr && t.xhr.readyState > 0 && t.xhr.abort(),
                        t.onClearQueue();
                    else {
                        if (!o.length) return;
                        t.xhr && t.xhr.readyState > 0 && t.queue[e] && t.xhr.abort(),
                            t.onCancel(e)
                    }
                },
                destroy: function () {
                    this.browse && this.browse.parentNode.removeChild(this.browse),
                        this.xhr = null,
                        this.__super("destroy")
                }
            }
        })),
            p.swf = function () {
                var e, t = document.getElementsByTagName("script"),
                    i = t[t.length - 1],
                    o = i.getAttribute("src");
                return o || (o = ""),
                    e = o.split("/").slice(0, -1).join("/"),
                e && (e += "/"),
                e + "uploader.swf"
            }(),
            h.flash = h.extend(function () {
                function i(e) {
                    if (e.src) {
                        var t = e.src + ( -1 !== e.src.indexOf("?") ? "&" : "?") + "__=" + s,
                            i = "",
                            o = {
                                type: "application/x-shockwave-flash"
                            },
                            a = {
                                wmode: "transparent",
                                allowScriptAccess: "always"
                            },
                            r = function (e) {
                                var t, i = "";
                                for (t in e) i += " " + t + '="' + e[t] + '"';
                                return i
                            };
                        if (function (t) {
                                for (var i, n = t.length,
                                         s = {}; n--;) s[t[n]] = 1;
                                for (i in e) s[i] ? o[i] = e[i] : a[i] = e[i]
                            }("width height id class style".split(" ")), a.src = t, n) {
                            o.codebase = "http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0",
                                o.classid = "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",
                                i += "<object" + r(o) + ">";
                            for (var l in a) i += '<param name="' + l + '" value="' + a[l] + '">';
                            i += "</object>"
                        } else i += "<embed" + r(a) + r(o) + ">";
                        return i
                    }
                }

                function o(e) {
                    n ? (e.style.display = "none",
                        function () {
                            if (4 === e.readyState) {
                                for (var t in e)"function" == typeof e[t] && (e[t] = null);
                                e.parentNode.removeChild(e)
                            } else setTimeout(arguments.callee, 15)
                        }()) : e.parentNode.removeChild(e)
                }

                var n = !!e.ActiveXObject,
                    a = n && !navigator.msDoNotTrack,
                    s = +new Date;
                return {
                    create: function (e) {
                        var o = this.options,
                            n = {
                                id: this.id,
                                path: function () {
                                    var e = location.pathname.split("/");
                                    return e.pop(),
                                    e.join("/") + "/"
                                }(),
                                action: o.action,
                                field: o.name,
                                src: o.swf,
                                desc: o.fileTypeDesc,
                                ext: o.fileTypeExts
                            };
                        return o.multiple && (n.multiple = 1),
                        o.debug && (n.debug = 1),
                        o.preview && (n.preview = 1, a && (n.previewSize = 31744)),
                        o.method && (n.method = o.method),
                            i({
                                src: o.swf,
                                style: e,
                                id: this.id,
                                "class": "uploader",
                                flashvars: t.param(n)
                            })
                    },
                    upload: function (e) {
                        var i = this,
                            o = i.options;
                        o.formData && i.browse.setData(t.param(t.isFunction(o.formData) ? o.formData.call(i) : o.formData)),
                            i.browse.startUpload("" + e.id)
                    },
                    cancel: function (e) {
                        var t = this.queue;
                        t.length && (e || (e = t[0].id)),
                            this.browse.cancelUpload(e)
                    },
                    destroy: function () {
                        o(this.browse),
                            this.__super("destroy")
                    }
                }
            }),
            t(function () {
                var i = t("body");
                i.on("change." + r, ":file." + r,
                    function () {
                        this.value && (e[this.id].onSelected(this.files), this.value = "")
                    }).on("click." + r, ":file." + r,
                    function () {
                        e[this.id].onMouseClick()
                    }),
                    i.on("mouseenter." + r, "div.upload-btn-wrap",
                        function () {
                            e[this.firstChild.id].onMouseOver()
                        }).on("mouseleave." + r, "div.upload-btn-wrap",
                        function () {
                            e[this.firstChild.id].onMouseOut()
                        }),
                    i.on("click." + r, "a.upload-cancel",
                        function (i) {
                            var o = t(this).closest(".queue"),
                                n = o.attr("id").split("___");
                            o.hasClass("upload-error") ? o.remove() : e[n[0]].cancel(n[1]),
                                i.preventDefault()
                        })
            }),
            h.guid = 0,
            h.uploading = !1,
            h.defaults = p,
            h.mimes = d,
            h.lang = c,
            h.i18n = s,
            h.stringifySize = o,
            h.parseSize = n,
            h.getShortName = a,
            t.uploader = h,
            t.fn.uploader = function (o) {
                var n, a = arguments,
                    s = this[0][l];
                return s !== i && (n = r + "_" + s),
                    a.length ? ("string" == typeof o && "on" !== o.substr(0, 2) ? n && e[n][o].apply(e[n], Array.prototype.slice.call(a, 1)) : (this.off("remove." + r).on("remove." + r,
                        function () {
                            e[this[l]].destroy()
                        }), o = t.extend({},
                        p, o), o.fileTypeExts = o.fileTypeExts.replace(/ /g, ""), h[o.mode] || (o.mode = "flash"), this.each(function () {
                        new h[o.mode](this, o)
                    })), this) : n ? e[n] : null
            },
            s({
                400: "(400)请求无效",
                404: "(404)请求的资源不存在",
                500: "(500)内部服务器错误",
                501: "(501)未执行",
                502: "(502)连接超时",
                600: "初始化上传发生错误",
                601: "请选择“{1}”格式的文件",
                602: "文件尺寸不能大于{1}"
            })
    }(window, jQuery);