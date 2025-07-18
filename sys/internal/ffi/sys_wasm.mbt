// Copyright 2024 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
typealias @ffi.XExternStringArray

///|
typealias @ffi.XExternString

///|
pub fn get_cli_args() -> Array[String] {
  let args = get_cli_args_ffi()
  @ffi.string_array_from_extern(args)
}

///|
fn get_cli_args_ffi() -> XExternStringArray = "__moonbit_fs_unstable" "args_get"

///|
pub fn get_env_vars() -> Map[String, String] {
  let env = get_env_vars_ffi()
  let tmp = @ffi.string_array_from_extern(env)
  let res = {}
  for i = 0; i < tmp.length(); i = i + 2 {
    res[tmp[i]] = tmp[i + 1]
  }
  res
}

///|
fn get_env_vars_ffi() -> XExternStringArray = "__moonbit_fs_unstable" "get_env_vars"

///|
pub fn set_env_var(key : String, value : String) -> Unit {
  let key = @ffi.string_to_extern(key)
  let value = @ffi.string_to_extern(value)
  set_env_var_ffi(key, value)
}

///|
fn set_env_var_ffi(key : XExternString, value : XExternString) = "__moonbit_fs_unstable" "set_env_var"

///|
pub fn unset_env_var(key : String) -> Unit {
  let key = @ffi.string_to_extern(key)
  unset_env_var_ffi(key)
}

///|
fn unset_env_var_ffi(key : XExternString) = "__moonbit_fs_unstable" "unset_env_var"

///|
pub fn exit(code : Int) = "__moonbit_sys_unstable" "exit"
