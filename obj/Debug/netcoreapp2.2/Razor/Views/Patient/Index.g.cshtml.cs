#pragma checksum "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "90d668b28b297215e3a5534c1288676e127ed73b"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Patient_Index), @"mvc.1.0.view", @"/Views/Patient/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Patient/Index.cshtml", typeof(AspNetCore.Views_Patient_Index))]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#line 1 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\_ViewImports.cshtml"
using ProyectoEpilepsia;

#line default
#line hidden
#line 2 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\_ViewImports.cshtml"
using ProyectoEpilepsia.Models;

#line default
#line hidden
#line 3 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\_ViewImports.cshtml"
using ProyectoEpilepsia.Resources;

#line default
#line hidden
#line 4 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\_ViewImports.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"90d668b28b297215e3a5534c1288676e127ed73b", @"/Views/Patient/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"c9fb24de986542a26b66249349376764569110cf", @"/Views/_ViewImports.cshtml")]
    public class Views_Patient_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(0, 2, true);
            WriteLiteral("\r\n");
            EndContext();
#line 2 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml"
  
    ViewData["Title"] = "Index";
    Layout = "_Layout";

#line default
#line hidden
            BeginContext(68, 6, true);
            WriteLiteral("\r\n<h2>");
            EndContext();
            BeginContext(75, 69, false);
#line 7 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml"
Write(RsShared.Welcome.Replace("{name}",@Context.Session.GetString("Name")));

#line default
#line hidden
            EndContext();
            BeginContext(144, 15, true);
            WriteLiteral("</h2>\r\n\r\n<span>");
            EndContext();
            BeginContext(160, 23, false);
#line 9 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml"
 Write(RsPatient.YourGuardians);

#line default
#line hidden
            EndContext();
            BeginContext(183, 161, true);
            WriteLiteral("</span>\r\n<table class=\"table\">\r\n    <thead>\r\n        <tr>\r\n            <td>Nombre</td>\r\n            <td>Apellido</td>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n");
            EndContext();
#line 18 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml"
         foreach (TblNonPatientData guardian in ViewBag.Guardians)
        {

#line default
#line hidden
            BeginContext(423, 30, true);
            WriteLiteral("        <tr>\r\n            <td>");
            EndContext();
            BeginContext(454, 18, false);
#line 21 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml"
           Write(guardian.FirstName);

#line default
#line hidden
            EndContext();
            BeginContext(472, 23, true);
            WriteLiteral("</td>\r\n            <td>");
            EndContext();
            BeginContext(496, 17, false);
#line 22 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml"
           Write(guardian.LastName);

#line default
#line hidden
            EndContext();
            BeginContext(513, 22, true);
            WriteLiteral("</td>\r\n        </tr>\r\n");
            EndContext();
#line 24 "C:\proyecto\Web\ProyectoEpilepsia\ProyectoEpilepsia\Views\Patient\Index.cshtml"
        }

#line default
#line hidden
            BeginContext(546, 22, true);
            WriteLiteral("    </tbody>\r\n</table>");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
