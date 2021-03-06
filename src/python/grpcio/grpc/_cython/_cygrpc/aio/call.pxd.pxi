# Copyright 2019 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


cdef class _AioCall:
    cdef:
        AioChannel _channel
        CallbackContext _watcher_call
        grpc_completion_queue * _cq
        grpc_experimental_completion_queue_functor _functor
        object _waiter_call
        list _references

    @staticmethod
    cdef void functor_run(grpc_experimental_completion_queue_functor* functor, int success) with gil
    @staticmethod
    cdef void watcher_call_functor_run(grpc_experimental_completion_queue_functor* functor, int success) with gil
