//==-------------- backend_types.hpp - SYCL backend types ------------------==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#pragma once

#include <CL/sycl/detail/defines.hpp>

#include <fstream>
#include <iostream>
#include <istream>
#include <string>

__SYCL_INLINE_NAMESPACE(cl) {
namespace sycl {

enum class backend : char { host, opencl, level_zero, cuda };

template <backend name, typename SYCLObjectT> struct interop;

inline std::ostream &operator<<(std::ostream &Out, backend be) {
  switch (be) {
  case backend::host:
    Out << std::string("host");
    break;
  case backend::opencl:
    Out << std::string("opencl");
    break;
  case backend::level_zero:
    Out << std::string("level_zero");
    break;
  case backend::cuda:
    Out << std::string("cuda");
  }
  return Out;
}

} // namespace sycl
} // __SYCL_INLINE_NAMESPACE(cl)
