using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PGM_EDITOR
{
    public struct MagicNumbers
    {
        public const double Right =  7F / 16F;
        public const double DownLeft = 3F / 16F;
        public const double Down = 5F / 16F;
        public const double DownRight = 1F / 16F;
    }

    public enum Options
    {
        ReduceColors,
        FloydSteinberg,
        HistogramEqualization,
        AverageFilter,
        MedianFilter,
        Gaussian,
        Laplace,
        Highlight,
        Erosion,
        Expansion
    }

    public enum AverageOptions
    {
        Normal,
        Median
    }
}
