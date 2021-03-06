/*!
 * Copyright 2020 by XGBoost Contributors
 */
#ifndef HISTOGRAM_CUH_
#define HISTOGRAM_CUH_
#include <thrust/transform.h>
#include "../../data/ellpack_page.cuh"

namespace xgboost {
namespace tree {

template <typename GradientSumT>
GradientSumT CreateRoundingFactor(common::Span<GradientPair const> gpair);

template <typename T>
DEV_INLINE T TruncateWithRoundingFactor(T const rounding_factor, float const x) {
  return (rounding_factor + static_cast<T>(x)) - rounding_factor;
}

template <typename GradientSumT>
void BuildGradientHistogram(EllpackDeviceAccessor const& matrix,
                            common::Span<GradientPair const> gpair,
                            common::Span<const uint32_t> ridx,
                            common::Span<GradientSumT> histogram,
                            GradientSumT rounding, bool shared);
}  // namespace tree
}  // namespace xgboost

#endif  // HISTOGRAM_CUH_
