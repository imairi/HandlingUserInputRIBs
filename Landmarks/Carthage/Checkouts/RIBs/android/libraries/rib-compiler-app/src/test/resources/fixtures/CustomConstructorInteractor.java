/*
 * Copyright (C) 2017. Uber Technologies
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package test;

import com.uber.rib.core.Interactor;
import com.uber.rib.core.InteractorComponent;
import com.uber.rib.core.Presenter;
import com.uber.rib.core.RibInteractor;
import com.uber.rib.core.Router;

@RibInteractor
public class CustomConstructorInteractor extends Interactor<Presenter, Router> {

    public CustomConstructorInteractor(String a, InteractorComponent dependency) { }
}
