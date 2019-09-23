; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-unknown-linux-gnu < %s | FileCheck %s

define i32 @test_minsize(i32 %X) optsize minsize nounwind readnone {
; CHECK-LABEL: test_minsize:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w8, #5
; CHECK-NEXT:    udiv w8, w0, w8
; CHECK-NEXT:    add w8, w8, w8, lsl #2
; CHECK-NEXT:    mov w9, #-10
; CHECK-NEXT:    cmp w0, w8
; CHECK-NEXT:    mov w8, #42
; CHECK-NEXT:    csel w0, w8, w9, eq
; CHECK-NEXT:    ret
  %rem = urem i32 %X, 5
  %cmp = icmp eq i32 %rem, 0
  %ret = select i1 %cmp, i32 42, i32 -10
  ret i32 %ret
}

define i32 @test_optsize(i32 %X) optsize nounwind readnone {
; CHECK-LABEL: test_optsize:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w8, #52429
; CHECK-NEXT:    movk w8, #52428, lsl #16
; CHECK-NEXT:    mov w9, #13108
; CHECK-NEXT:    movk w9, #13107, lsl #16
; CHECK-NEXT:    mul w8, w0, w8
; CHECK-NEXT:    mov w10, #-10
; CHECK-NEXT:    cmp w8, w9
; CHECK-NEXT:    mov w8, #42
; CHECK-NEXT:    csel w0, w8, w10, lo
; CHECK-NEXT:    ret
  %rem = urem i32 %X, 5
  %cmp = icmp eq i32 %rem, 0
  %ret = select i1 %cmp, i32 42, i32 -10
  ret i32 %ret
}
