﻿#pragma checksum "..\..\..\main.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "E4D8150061ABE9CBDA372F441239CF9F"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace PGM_EDITOR {
    
    
    /// <summary>
    /// main
    /// </summary>
    public partial class main : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 6 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image imgPhoto;
        
        #line default
        #line hidden
        
        
        #line 7 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Shapes.Rectangle rectangle1;
        
        #line default
        #line hidden
        
        
        #line 8 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnLoad;
        
        #line default
        #line hidden
        
        
        #line 9 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnRotateR;
        
        #line default
        #line hidden
        
        
        #line 10 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnRotateL;
        
        #line default
        #line hidden
        
        
        #line 11 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnUndo;
        
        #line default
        #line hidden
        
        
        #line 12 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnSave;
        
        #line default
        #line hidden
        
        
        #line 13 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnRedo;
        
        #line default
        #line hidden
        
        
        #line 14 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnReduzir;
        
        #line default
        #line hidden
        
        
        #line 15 "..\..\..\main.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnHisto;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/PGM_EDITOR;component/main.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\main.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 4 "..\..\..\main.xaml"
            ((PGM_EDITOR.main)(target)).SizeChanged += new System.Windows.SizeChangedEventHandler(this.Window_SizeChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.imgPhoto = ((System.Windows.Controls.Image)(target));
            return;
            case 3:
            this.rectangle1 = ((System.Windows.Shapes.Rectangle)(target));
            return;
            case 4:
            this.btnLoad = ((System.Windows.Controls.Button)(target));
            
            #line 8 "..\..\..\main.xaml"
            this.btnLoad.Click += new System.Windows.RoutedEventHandler(this.btnLoad_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.btnRotateR = ((System.Windows.Controls.Button)(target));
            
            #line 9 "..\..\..\main.xaml"
            this.btnRotateR.Click += new System.Windows.RoutedEventHandler(this.btnRotateR_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.btnRotateL = ((System.Windows.Controls.Button)(target));
            
            #line 10 "..\..\..\main.xaml"
            this.btnRotateL.Click += new System.Windows.RoutedEventHandler(this.btnRotateL_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.btnUndo = ((System.Windows.Controls.Button)(target));
            
            #line 11 "..\..\..\main.xaml"
            this.btnUndo.Click += new System.Windows.RoutedEventHandler(this.btnUndo_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.btnSave = ((System.Windows.Controls.Button)(target));
            
            #line 12 "..\..\..\main.xaml"
            this.btnSave.Click += new System.Windows.RoutedEventHandler(this.btnSave_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.btnRedo = ((System.Windows.Controls.Button)(target));
            
            #line 13 "..\..\..\main.xaml"
            this.btnRedo.Click += new System.Windows.RoutedEventHandler(this.btnRedo_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.btnReduzir = ((System.Windows.Controls.Button)(target));
            
            #line 14 "..\..\..\main.xaml"
            this.btnReduzir.Click += new System.Windows.RoutedEventHandler(this.btnReduzir_Click);
            
            #line default
            #line hidden
            return;
            case 11:
            this.btnHisto = ((System.Windows.Controls.Button)(target));
            
            #line 15 "..\..\..\main.xaml"
            this.btnHisto.Click += new System.Windows.RoutedEventHandler(this.btnHisto_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

